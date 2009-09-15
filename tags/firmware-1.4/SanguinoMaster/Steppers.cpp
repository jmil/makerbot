#include "WProgram.h"
#include "Steppers.h"
#include "CircularBuffer.h"
#include "EEPROMOffsets.h"
#include <EEPROM.h>
#include "Configuration.h"
#include "Timer1.h"
#include "Utils.h"

//our point queue variables
uint8_t rawPointBuffer[POINT_QUEUE_SIZE * POINT_SIZE];
CircularBuffer pointBuffer((POINT_QUEUE_SIZE * POINT_SIZE), rawPointBuffer);


//init our variables
volatile long max_delta;

volatile long x_counter;
volatile bool x_direction;

volatile long y_counter;
volatile bool y_direction;

volatile long z_counter;
volatile bool z_direction;

//our position tracking variables
volatile LongPoint current_steps;
volatile LongPoint target_steps;
volatile LongPoint delta_steps;
volatile LongPoint range_steps;

volatile bool is_point_queue_empty = true;

inline void grab_next_point();
inline void do_step(int8_t step_pin);
inline bool read_switch(int8_t pin);


/// Prototypes
bool find_axis_dir(int8_t step_pin, int8_t dir_pin, 
		   int8_t switch_pin, bool maximum);

/**
 *  Sanguino 3rd Generation Firmware (S3G)
 *
 *  Specification for this protocol is located at: 
 *    http://docs.google.com/Doc?id=dd5prwmp_14ggw37mfp
 *  
 *  License: GPLv2
 *  Authors: Marius Kintel, Adam Mayer, and Zach Hoeken
 */

/// We need a logical XOR, so we'll implement it here.
inline bool logic_xor(bool a, bool b) {
  return a?!b:b;
}


bool x_invert;
bool y_invert;
bool z_invert;

//initialize our stepper drivers
void init_steppers()
{
  //clear our point buffer
  pointBuffer.clear();

  //initialize all our pins.
  pinMode(X_STEP_PIN, OUTPUT);
  pinMode(X_DIR_PIN, OUTPUT);
  pinMode(X_ENABLE_PIN, OUTPUT);
  pinMode(X_MIN_PIN, INPUT);
  pinMode(X_MAX_PIN, INPUT);

  pinMode(Y_STEP_PIN, OUTPUT);
  pinMode(Y_DIR_PIN, OUTPUT);
  pinMode(Y_ENABLE_PIN, OUTPUT);
  pinMode(Y_MIN_PIN, INPUT);
  pinMode(Y_MAX_PIN, INPUT);

  pinMode(Z_STEP_PIN, OUTPUT);
  pinMode(Z_DIR_PIN, OUTPUT);
  pinMode(Z_ENABLE_PIN, OUTPUT);
  pinMode(Z_MIN_PIN, INPUT);
  pinMode(Z_MAX_PIN, INPUT);

  // Load the inversion data if it's available.
  if (hasEEPROMSettings()) {
    uint8_t inversions = EEPROM.read(EEPROM_AXIS_INVERSION_OFFSET);
    x_invert = (inversions & (0x01 << 0)) != 0;
    y_invert = (inversions & (0x01 << 1)) != 0;
    z_invert = (inversions & (0x01 << 2)) != 0;
  } else {
    x_invert = y_invert = z_invert = false;
  }
#if SENSORS_INVERTING == 1
  // If we are using inverting endstops, we'll turn on the pull-ups on these pins.
  // This enables us to operate without endstops if necessary.
  digitalWrite(X_MIN_PIN, HIGH);
  digitalWrite(X_MAX_PIN, HIGH);
  digitalWrite(Y_MIN_PIN, HIGH);
  digitalWrite(Y_MAX_PIN, HIGH);
  digitalWrite(Z_MIN_PIN, HIGH);
  digitalWrite(Z_MAX_PIN, HIGH);
#endif

  //turn them off to start.
  disable_steppers();

  //zero our deltas.
  delta_steps.x = 0;
  delta_steps.y = 0;
  delta_steps.z = 0;
  
  //zero our posison.
  current_steps.x = 0;
  current_steps.y = 0;
  current_steps.z = 0;
  target_steps.x = 0;
  target_steps.y = 0;
  target_steps.z = 0;
    
  //prep timer 1 for handling DDA stuff.
  setupTimer1Interrupt();
  setTimer1Micros(2500);
  enableTimer1Interrupt();
}

void seek_minimums(bool find_x, bool find_y, bool find_z, unsigned long step_delay, unsigned int timeout_seconds)
{
  unsigned long start = millis();
  unsigned long end = millis() + (timeout_seconds*1000);


  //no dda interrupts.
  disableTimer1Interrupt();
  
  enable_steppers(find_x,find_y,find_z);

  bool found_x = false;
  bool found_y = false;
  bool found_z = false;

  //do it until we time out.
  while (millis() < end)
  {
    //do our steps and check for mins.
    if (find_x && !found_x)
    {
      found_x = find_axis_dir(X_STEP_PIN, X_DIR_PIN, X_MIN_PIN, x_invert);
      current_steps.x = 0;
    }
    if (find_y && !found_y)
    {
      found_y = find_axis_dir(Y_STEP_PIN, Y_DIR_PIN, Y_MIN_PIN, y_invert);
      current_steps.y = 0;
    }
    if (find_z && !found_z)
    {
      found_z = find_axis_dir(Z_STEP_PIN, Z_DIR_PIN, Z_MIN_PIN, z_invert);
      current_steps.z = 0;
    }

    //check to see if we've found all required switches.
    if (find_x && !found_x)
      true;
    else if (find_y && !found_y)
      true;
    else if (find_z && !found_z)
      true;
    //found them all.
    else
      break;

    //do our delay for our axes.
    if (step_delay <= 65535)
      delayMicrosecondsInterruptible(step_delay);
    else
      delay(step_delay/1000);
  }
  disable_steppers();

  //turn on point seeking agian.
  enableTimer1Interrupt();
}

void seek_maximums(bool find_x, bool find_y, bool find_z, unsigned long step_delay, unsigned int timeout_seconds)
{
  unsigned long start = millis();
  unsigned long end = millis() + (timeout_seconds*1000);

  //no dda interrupts.
  disableTimer1Interrupt();

  enable_steppers(find_x,find_y,find_z);

  bool found_x = false;
  bool found_y = false;
  bool found_z = false;

  //do it until we time out.
  while (millis() < end)
  {
    //do our steps and check for mins.
    if (find_x && !found_x)
    {
      found_x = find_axis_dir(X_STEP_PIN, X_DIR_PIN, X_MAX_PIN, !x_invert);
      range_steps.x = current_steps.x;
    }
    if (find_y && !found_y)
    {
      found_y = find_axis_dir(Y_STEP_PIN, Y_DIR_PIN, Y_MAX_PIN, !y_invert);
      range_steps.y = current_steps.y;
    }
    if (find_z && !found_z)
    {
      found_z = find_axis_dir(Z_STEP_PIN, Z_DIR_PIN, Z_MAX_PIN, !z_invert);
      range_steps.z = current_steps.z;
    }

    //check to see if we've found all required switches.
    if (find_x && !found_x)
      true;
    else if (find_y && !found_y)
      true;
    else if (find_z && !found_z)
      true;
    //found them all.
    else
    {
      break;
    }

    //do our delay for our axes.
    if (step_delay <= 65535)
      delayMicrosecondsInterruptible(step_delay);
    else
      delay(step_delay/1000);
  }
  disable_steppers();

  //turn on point seeking agian.
  enableTimer1Interrupt();
}

bool find_axis_dir(int8_t step_pin, int8_t dir_pin, 
		      int8_t switch_pin, bool maximum)
{
  //are we at the end of our travel?
  if (read_switch(switch_pin))
  {
    //move slowly in reverse until the switch goes open.
    digitalWrite(dir_pin, maximum?LOW:HIGH);
    while (read_switch(switch_pin))
    {
      do_step(step_pin);
      delay(500);
    }
    //then move one step in the given direction.
    digitalWrite(dir_pin, maximum?HIGH:LOW);
    do_step(step_pin);
    return true;
  }
  else
  {
    digitalWrite(dir_pin, maximum?HIGH:LOW);
    do_step(step_pin);
  }
  return false;
}

bool find_axis_min(int8_t step_pin, int8_t dir_pin, int8_t min_pin)
{
  return find_axis_dir(step_pin,dir_pin,min_pin,false);
}

bool find_axis_max(int8_t step_pin, int8_t dir_pin, int8_t max_pin)
{
  return find_axis_dir(step_pin,dir_pin,max_pin,true);
}

inline void grab_next_point()
{
  //can we even step to this?
  if (pointBuffer.size() >= POINT_SIZE)
  {
    //whats our target?
    target_steps.x = (long)pointBuffer.remove_32();
    target_steps.y = (long)pointBuffer.remove_32();
    target_steps.z = (long)pointBuffer.remove_32();

    //figure out our deltas
    delta_steps.x = target_steps.x - current_steps.x;
    delta_steps.y = target_steps.y - current_steps.y;
    delta_steps.z = target_steps.z - current_steps.z;
    
    //what direction?
    x_direction = delta_steps.x >= 0;
    y_direction = delta_steps.y >= 0;
    z_direction = delta_steps.z >= 0;

    //set our direction pins as well
    digitalWrite(X_DIR_PIN, logic_xor(x_invert,x_direction));
    digitalWrite(Y_DIR_PIN, logic_xor(y_invert,y_direction));
    digitalWrite(Z_DIR_PIN, logic_xor(z_invert,z_direction));

    //now get us absolute coords
    delta_steps.x = abs(delta_steps.x);
    delta_steps.y = abs(delta_steps.y);
    delta_steps.z = abs(delta_steps.z);

    //enable our steppers if needed.
    enable_needed_steppers();

    //figure out our deltas
    max_delta = 0;
    max_delta = max(delta_steps.x, delta_steps.y);
    max_delta = max(delta_steps.z, max_delta);
    
    //init stuff.
    x_counter = -max_delta/2;
    y_counter = -max_delta/2;
    z_counter = -max_delta/2;

    //start the move!
    setTimer1Micros(pointBuffer.remove_32());
    enableTimer1Interrupt();
  }
  else
    is_point_queue_empty = true; //only real place to check.  
}

//do a single step on our DDA line!
SIGNAL(SIG_OUTPUT_COMPARE1A)
{
  check_endstops(); // TODO: this is perhaps inefficient, but necessary.
  //increment our x counter, and take steps if required.
  if (current_steps.x != target_steps.x)
  {
    x_counter += delta_steps.x;

    if (x_counter > 0)
    {
      do_step(X_STEP_PIN);
      x_counter -= max_delta;

      if (x_direction)
        current_steps.x++;
      else
        current_steps.x--;
    }
  }

  //increment our y counter, and take steps if required.
  if (current_steps.y != target_steps.y)
  {
    y_counter += delta_steps.y;

    if (y_counter > 0)
    {
      do_step(Y_STEP_PIN);
      y_counter -= max_delta;

      if (y_direction)
        current_steps.y++;
      else
        current_steps.y--;
    }
  }

  //increment our z counter, and take steps if required.
  if (current_steps.z != target_steps.z)
  {
    z_counter += delta_steps.z;

    if (z_counter > 0)
    {
      do_step(Z_STEP_PIN);
      z_counter -= max_delta;

      if (z_direction)
        current_steps.z++;
      else
        current_steps.z--;
    }
  }        

  //we're either at our target
  if (at_target())
  {
//    finishedPoints++;
//    Serial.print("Finished:");
//    Serial.println(finishedPoints, DEC);
    grab_next_point();
  }
}

//actually send a step signal.
inline void do_step(int8_t step_pin)
{
  digitalWrite(step_pin, HIGH);
#ifdef STEP_DELAY
  delayMicrosecondsInterruptible(STEP_DELAY);
#endif
  digitalWrite(step_pin, LOW);
}

//figure out if we're at a switch or not
inline bool read_switch(int8_t pin)
{
  //dual read as crude debounce
  if (SENSORS_INVERTING)
    return !digitalRead(pin) && !digitalRead(pin);
  else
    return digitalRead(pin) && digitalRead(pin);
}

//looks at our endstops and disables our motor if we hit one.
void check_endstops()
{
  if ( (x_direction && read_switch(X_MAX_PIN)) ||
       (!x_direction && read_switch(X_MIN_PIN)) )
    digitalWrite(X_ENABLE_PIN, STEPPER_DISABLE);

  if ( (y_direction && read_switch(Y_MAX_PIN)) ||
       (!y_direction && read_switch(Y_MIN_PIN)) )
    digitalWrite(Y_ENABLE_PIN, STEPPER_DISABLE);

  if ( (z_direction && read_switch(Z_MAX_PIN)) ||
       (!z_direction && read_switch(Z_MIN_PIN)) )
    digitalWrite(Z_ENABLE_PIN, STEPPER_DISABLE);
}

void enable_steppers(bool x, bool y, bool z)
{
  if (x) { digitalWrite(X_ENABLE_PIN, STEPPER_ENABLE); }
  if (y) { digitalWrite(Y_ENABLE_PIN, STEPPER_ENABLE); }
  if (z) { digitalWrite(Z_ENABLE_PIN, STEPPER_ENABLE); }
}

// enable our steppers so we can move them.  disable any steppers
// not about to be set in motion to reduce power and heat.
// TODO: make this a configuration option (HOLD_AXIS?); there are some
// situations (milling) where you want to leave the steppers on to
// hold the position.
// ZMS: made X/Y axes always on once used.
void enable_needed_steppers()
{
  enable_steppers(delta_steps.x > 0, delta_steps.y > 0, delta_steps.z > 0);
  if (!(delta_steps.z > 0)) {
    disable_steppers(false,false,true); // explicitly turn off Z stepper when not needed
  }
}

void disable_steppers(bool x, bool y, bool z)
{
  //disable our steppers
  if (x) { digitalWrite(X_ENABLE_PIN, STEPPER_DISABLE); }
  if (y) { digitalWrite(Y_ENABLE_PIN, STEPPER_DISABLE); }
  if (z) { digitalWrite(Z_ENABLE_PIN, STEPPER_DISABLE); }
}

//turn off steppers to save juice / keep things cool.
void disable_steppers()
{
  //disable our steppers
  disable_steppers(true,true,true);
}

//read all of our states into a single byte.
int8_t get_endstop_states()
{
  int8_t state = 0;

  //each one is its own bit in the byte.
  state |= read_switch(Z_MAX_PIN) << 5;
  state |= read_switch(Z_MIN_PIN) << 4;
  state |= read_switch(Y_MAX_PIN) << 3;
  state |= read_switch(Y_MIN_PIN) << 2;
  state |= read_switch(X_MAX_PIN) << 1;
  state |= read_switch(X_MIN_PIN);

  return state;
}

//queue a point for us to move to
void queue_absolute_point(long x, long y, long z, unsigned long micros)
{
  //wait until we have free space
  while (pointBuffer.remainingCapacity() < POINT_SIZE)
    delay(1);

  disableTimer1Interrupt();

  //okay, add in our points.
  pointBuffer.append_32(x);
  pointBuffer.append_32(y);
  pointBuffer.append_32(z);
  pointBuffer.append_32(micros);

  //just in case we got interrupted and it changed.
  is_point_queue_empty = false;

  enableTimer1Interrupt();
}

bool is_point_buffer_empty()
{
  //okay, we got points in the buffer.
  if (!is_point_queue_empty)
    return false;

  //still working on a point.
  //todo: do we need this?
  if (!at_target())
    return false;

  //nope, we're done.
  return true;
}

bool at_target()
{
  if (current_steps.x == target_steps.x && current_steps.y == target_steps.y && current_steps.z == target_steps.z)
    return true;
  else
    return false;
}

void wait_until_target_reached()
{
  //todo: check to see if this is what is locking up our code?
  while(!is_point_buffer_empty())
    delay(1);
}

bool point_buffer_has_room(uint8_t size)
{
  return (pointBuffer.remainingCapacity() >= size);
}


void set_position(const LongPoint& pos)
{
  target_steps.x = current_steps.x = pos.x;
  target_steps.y = current_steps.y = pos.y;
  target_steps.z = current_steps.z = pos.z;
}

const LongPoint get_position()
{
  LongPoint p;
  p.x = current_steps.x;
  p.y = current_steps.y;
  p.z = current_steps.z;
  return p;
}


void set_range(const LongPoint& range)
{
  range_steps.x = range.x;
  range_steps.y = range.y;
  range_steps.z = range.z;
}

const LongPoint get_range()
{
  LongPoint p;
  p.x = range_steps.x;
  p.y = range_steps.y;
  p.z = range_steps.z;
  return p;
}

void resume_stepping()
{
  enable_needed_steppers();
  enableTimer1Interrupt();
}

void pause_stepping()
{
  disableTimer1Interrupt();
  disable_steppers();
}
