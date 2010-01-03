/*
 * MakerBotWatch - Open Hardware LED Wrist Watch
 * Copyright (C) 2009 by Jon Hodgins
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/*********************************************************
 **Code for the MakerWatch
 **
 **This code shows the time current time on the face of the
 ** watch and has an alarm that can be turned on and off.
 **To set the time, push and hold button 3 until the display
 ** goes black and release the button. Push button 1 and 2
 ** in this state to increase and decrease the hours. If
 ** the time is PM the 4 minute LEDs will light up what 
 ** setting the hour(for both time and alarm, but not while
 ** displaying the time)
 ** Push button 3 again and you can now change the minutes.
 **
 **From setting the time, push and hold button 3 until the
 ** screen goes black again. To turn the alarm on push and
 ** hold button 1 or 2 until the display goes black. You can
 ** now change the hour of the alarm by using buttons 1 and 2.
 ** Push button 3 and you can change the alarm minutes.
 **To turn off the alarm, push and hold button 1 or 2 again,
 ** until the screen goes black.
 **To return to the default state, push and hold button 3 until
 ** the display goes black.
 **
 **If you wait too long while setting the time or alarm,
 ** the clock will return to displaying the current time 
 ** (all changes will be saved)
 **
 ** Date: December 26, 2009
 ** Jon Hodgins
 *********************************************************/

//MakerBotWatch .h and .cpp modified from: http://wiki.makerbot.com/makerbot-watch
#include "MakerBotWatch.h"

MakerBotWatch watch;

/**********************************
 **state machine variables
 **
 **the state machine controls the display and
 **setting the time and alarm
 **********************************/
byte buttonEvent = 0;//stores the user input
long buttonTimer = millis();//used to tell if the button is being held
long buttonHoldTime = 1800;//the mS to hold the button before something happens
long timeSetTimeout = 8000;//the mS to wait before the watch resets to default

#define noButtonEvent        0
#define buttonEvent1         1
#define buttonEvent1Hold     2
#define buttonEvent2         3
#define buttonEvent2Hold     4
#define buttonEvent3         5
#define buttonEvent3Hold     6

byte state=0;//the current state of the watch

//the various states of the watch, each is described in more detatil in stateMachine()
#define DEFAULT_STATE        0
#define EXIT_DEFAULT_STATE   1
#define ENTER_SET_TIME_STATE 2
#define SET_HOUR_STATE       3
#define INC_HOUR_STATE       4
#define DEC_HOUR_STATE       5
#define EXIT_HOUR_STATE      6
#define SET_MIN_STATE        7
#define INC_MIN_STATE        8
#define DEC_MIN_STATE        9
#define EXIT_MIN_STATE       10

#define ENTER_SET_AL_STATE   11
#define AL_SET_HOUR_STATE    12
#define AL_INC_HOUR_STATE    13
#define AL_DEC_HOUR_STATE    14
#define AL_EXIT_HOUR_STATE   15
#define AL_SET_MIN_STATE     16
#define AL_INC_MIN_STATE     17
#define AL_DEC_MIN_STATE     18
#define AL_EXIT_MIN_STATE    19
#define ENTER_DEFAULT_STATE  20

/**********************************
 **clock variables
 **********************************/
int8_t hours;
int8_t minutes;
#define AM 0
#define PM 1
long lastClockTime=0, currentClockTime=0, lastTimeUpdated=0;//variables to keep the time going
boolean AMPM=0;//indicates if the current time is morning or afternoon, not dispalyed unless setting the time and alarm
const long oneMin=60116;//the length of 1 minute in ms(adjusted for clock speed variances, you will also need to adjust)

/**********************************
 **alarm variables
 **********************************/
int8_t alarmHours;
int8_t alarmMinutes;
boolean alarmAMPM=0;
boolean alarmOn=false;//turns the alarm on or off
boolean alarmPlaying=false;//tells the alarm to play the music
boolean alarmSounded=true;//stops the alarm from going off more than once for the same time

/**********************************
 **input variables
 **********************************/
boolean PB1,PB2,PB3;//push button variables

boolean blinkVariable=0;//blinks at a regular interval to show when a time is being set
byte blinkRate = 500;//the mS the blink is on (and off)

/**********************************
 **music variables
 **modified from: http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1241248988
 **********************************/
// defines for the frequency of the notes (.5 x freq of mid C)
#define REST    0     // 0 Hz
#define GSL   208     //g sharp (lower octave)
#define AN    220     //A, 440 Hz
#define AS    233     //A sharp, 466 Hz
#define BN    247     //B, 493 Hz
#define CN    261     //C, 523 Hz
#define CS    277     //C sharp, 554 Hz
#define DN    294     //D, 588 Hz
#define DS    311     //D sharp, 622 Hz
#define EN    330     //E, 658 Hz
#define FN    349     //F, 698 Hz
#define FS    370     //F sharp, 740 Hz
#define GN    392     //G, 784 Hz
#define GS    415     //G sharp, 830 Hz
// defines for the duration of the notes (in ms)
#define wh    1024    //whole note
#define h      512    //half note
#define dq     448    //dotted quarter note
#define q      256    //quarter note
#define qt     170    //???
#define de     192    //dotted eighth note
#define e      128    //eighth note
#define et      85    //???

const int numNotes = 17;
int songNote[numNotes] = {//the final fantasy battle victory music
  CN,REST,CN,REST,CN,REST,CN,REST,GSL,REST,AS,REST,CN,REST,AN,CN,REST};
int noteDuration[numNotes] = {
  q,5    ,q,5    ,q,5    ,dq,5   ,dq ,5   ,dq,5   ,q,e  ,q,h ,wh   };

/**********************************
 **code that runs once at startup
 **********************************/
void setup()
{
}

/**********************************
 **The main program loop
 **********************************/
void loop()
{
  clockUpdate();//keep the time current

  getUserInput();//check for button presses

  stateMachine();//decide what to do with the input and what to display
}


/**********************************
 **Checks the 3 buttons and updates the variable
 ** buttonEvent with the results
 **********************************/
void getUserInput(void)
{
  //used to see if a button has been pushed or released,
  //which resets the holding timer. If the holding timer
  //eventually exceeds a set time the button is considered held
  int oldButtonEvent = buttonEvent;

  //read the buttons
  PB1 = digitalRead(BUTTON1);
  PB2 = digitalRead(BUTTON2);
  PB3 = digitalRead(BUTTON3);

  //update the output
  buttonEvent=noButtonEvent;
  if(!PB1)
    buttonEvent=buttonEvent1;
  if(!PB2)
    buttonEvent=buttonEvent2;
  if(!PB3)
    buttonEvent=buttonEvent3;

  //reset the timer if something changes
  if(oldButtonEvent != buttonEvent)
    buttonTimer = millis();

  //change the result if the button has been held for a set length of time
  if(millis()-buttonTimer > buttonHoldTime)
  {
    if(!PB1)
      buttonEvent=buttonEvent1Hold;
    if(!PB2)
      buttonEvent=buttonEvent2Hold;
    if(!PB3)
      buttonEvent=buttonEvent3Hold;
  }

}

/**********************************
 **This portion of the code decides what to do with the user input and what to show on the display
 **********************************/
void stateMachine(void)
{
  //if nothing has happened for a while and the clock is not in the default state
  if(millis()-buttonTimer > timeSetTimeout && state != DEFAULT_STATE)
    state = DEFAULT_STATE;//put it back in the default state

  switch(state)
  {
  case DEFAULT_STATE:
    alarm();//check the alarm

      watch.setTime(hours, minutes);//set the display to show the time
    watch.showTime();//show the current time

      if(alarmPlaying==false)//if the alarm is not making noise
    {
      if(buttonEvent == buttonEvent3)//if button 3 is pushed
        state = EXIT_DEFAULT_STATE;//change state to decide what to do
    }
    else//if the alarm is making noise
    {
      if(buttonEvent != noButtonEvent)//and a button is pushed
        alarmPlaying=false;//turn off the alarm sound
    }
    break;

  case EXIT_DEFAULT_STATE:
    watch.setTime(hours, minutes);
    watch.showTime();
    if(buttonEvent == noButtonEvent)//if all buttons are released
      state = DEFAULT_STATE;//go back to the default state
    if(buttonEvent == buttonEvent3Hold)//if button 3 is held
        state = ENTER_SET_TIME_STATE;//set the time
    break;

  case ENTER_SET_TIME_STATE:
    if(buttonEvent == noButtonEvent)//wait for the user to release the button
      state = SET_HOUR_STATE;//change state to set the hour
    break;

  case SET_HOUR_STATE:
    updateBlink();//update the flashing variable for the display
    if(blinkVariable==HIGH)
    {
      if(AMPM==PM)//turn on the 4 minute LEDs if it is PM
          watch.setTime(hours, 4);
      else//otherwise display the minutes
      watch.setTime(hours, minutes);
      watch.showTime();
    }
    if(buttonEvent == buttonEvent1)//if button 1 is pushed
      state = INC_HOUR_STATE;//increase the hour
    if(buttonEvent == buttonEvent2)//if button 2 is pushed
      state = DEC_HOUR_STATE;//decrease the hour
    if(buttonEvent == buttonEvent3)//if button 3 is pushed
      state = EXIT_HOUR_STATE;//go here to wait for the user and decide what state to go to next
    break;

  case INC_HOUR_STATE:
    watch.setTime(hours, minutes);
    watch.showTime();
    if(buttonEvent == noButtonEvent)//wait for the user to release the button
    {
      hours = (hours+1)%12;//increase the hour by one
      if(hours==0)
        if(AMPM==PM)
          AMPM=AM;
        else
          AMPM=PM;
      state = SET_HOUR_STATE;//and return to change the hour again
    }
    break;

  case DEC_HOUR_STATE:
    watch.setTime(hours, minutes);
    watch.showTime();
    if(buttonEvent == noButtonEvent)//wait for the user to release the button
    {
      hours = (hours-1);//decrease the hour by one
      if(hours < 0)
      {
        hours=11;
        if(AMPM==PM)
          AMPM=AM;
        else
          AMPM=PM;
      }
      state = SET_HOUR_STATE;//and return to change the hour again
    }
    break;

  case EXIT_HOUR_STATE:
    watch.setTime(hours, minutes);
    watch.showTime();
    if(buttonEvent == noButtonEvent)//wait for the user to release the button
      state = SET_MIN_STATE;//and change state to set the minutes
    if(buttonEvent == buttonEvent3Hold)//if button 3 is held
        state = ENTER_SET_AL_STATE;//change state to set the alarm
    break;

  case SET_MIN_STATE:
    updateBlink();
    watch.setTime(hours, minutes);
    if(blinkVariable==HIGH)
      watch.showTime();
    if(buttonEvent == buttonEvent1)//if button 1 is pushed
      state = INC_MIN_STATE;//increase the minutes
    if(buttonEvent == buttonEvent2)//if button 2 is pushed
      state = DEC_MIN_STATE;//decrease the minutes
    if(buttonEvent == buttonEvent3)//if button 3 is pushed
      state = EXIT_MIN_STATE;//wait for the user to release in this state and decide what to do
    break;

  case INC_MIN_STATE:
    watch.setTime(hours, minutes);
    watch.showTime();
    if(buttonEvent == noButtonEvent)//when all buttons are released
    {
      minutes = (minutes+1)%60;//increase the minutes by one
      state = SET_MIN_STATE;//and go back to change the minutes again
    }
    break;

  case DEC_MIN_STATE:
    watch.setTime(hours, minutes);
    watch.showTime();
    if(buttonEvent == noButtonEvent)//when all buttons are released
    {
      minutes = (minutes-1);//decrease the minutes by one
      if(minutes < 0)
        minutes=59;
      state = SET_MIN_STATE;//and go back to change the minutes again
    }
    break;

  case EXIT_MIN_STATE:
    watch.setTime(hours, minutes);
    watch.showTime();
    if(buttonEvent == noButtonEvent)//when the button is released
      state = SET_HOUR_STATE;//change state to set the hour
    if(buttonEvent == buttonEvent3Hold)//if the button is held
        state = ENTER_SET_AL_STATE;//change state to set the alarm
    break;


  case ENTER_SET_AL_STATE:
    if(buttonEvent == noButtonEvent)//when the button is released
      state = AL_SET_HOUR_STATE;//change state to set the alarm hour
    break;

  case AL_SET_HOUR_STATE:
    updateBlink();
    if(alarmOn == true)//if the alarm is turned on
    {
      if(blinkVariable==HIGH)//update the display so it blinks
      {
        if(AMPM==PM)
          watch.setTime(alarmHours, 4);//if the time is PM light the 4 minute LEDs to indicate this
        else
          watch.setTime(alarmHours, alarmMinutes);
        watch.showTime();
      }
      if(buttonEvent == buttonEvent1)
        state = AL_INC_HOUR_STATE;//wait for the user to relese the button in this state
      if(buttonEvent == buttonEvent2)
        state = AL_DEC_HOUR_STATE;//wait for the user to relese the button in this state
      if(buttonEvent == buttonEvent3)
        state = AL_EXIT_HOUR_STATE;//wait for the user to relese the button or keep holding it to leave setup mode
    }
    else//show that the alarm is off
    {
      if(buttonEvent == buttonEvent1Hold || buttonEvent == buttonEvent2Hold)//if the user holds button 1 or 2
      {
        if(alarmOn == false)
          alarmOn = true;//turn the alarm on
        else
          alarmOn = false;//turn the alarm off
        state = ENTER_SET_AL_STATE;//wait for the user to release the button in this state
      }
      if(buttonEvent == buttonEvent3Hold)
        state = ENTER_DEFAULT_STATE;//wait for the user to relese the button or keep holding it to leave setup mode
      watch.setTime(6, 34);//not ideal, may need to change to make clearer
      watch.showTime();
    }
    break;

  case AL_INC_HOUR_STATE:
    watch.setTime(alarmHours, alarmMinutes);
    watch.showTime();
    if(buttonEvent == noButtonEvent)//wait until all buttons are released
    {
      alarmHours = (alarmHours+1)%12;//increase the alarm hour
      if(alarmHours==0)
        if(alarmAMPM==PM)
          alarmAMPM=AM;
        else
          alarmAMPM=PM;
      state = AL_SET_HOUR_STATE;//return to set alarm hour
    }
    if(buttonEvent == buttonEvent1Hold || buttonEvent == buttonEvent2Hold)//if the user holds button 1 or 2
    {
      if(alarmOn == false)
        alarmOn = true;//turn the alarm on
      else
        alarmOn = false;//turn the alarm off
      state = ENTER_SET_AL_STATE;//wait for the user to release the button in this state
    }
    break;

  case AL_DEC_HOUR_STATE:
    if(buttonEvent == noButtonEvent)//wait until all buttons are released
    {
      alarmHours = (alarmHours-1);//decrese the alarm hour
      if(alarmHours < 0)
      {
        alarmHours=11;
        if(alarmAMPM==PM)
          alarmAMPM=AM;
        else
          alarmAMPM=PM;
      }
      state = AL_SET_HOUR_STATE;//return to set alarm hour
    }
    if(buttonEvent == buttonEvent1Hold || buttonEvent == buttonEvent2Hold)//if the user holds button 1 or 2
    {
      if(alarmOn == false)
        alarmOn = true;//turn the alarm on
      else
        alarmOn = false;//turn the alarm off
      state = ENTER_SET_AL_STATE;//wait for the user to release the button in this state
    }
    watch.setTime(alarmHours, alarmMinutes);
    watch.showTime();
    break;

  case AL_EXIT_HOUR_STATE:
    if(buttonEvent == noButtonEvent)//when all buttons are released
      state = AL_SET_MIN_STATE;//change state to set the minutes
    if(buttonEvent == buttonEvent3Hold)//if button 3 is held
    {
      state = ENTER_DEFAULT_STATE;//return to the main state
    }
    watch.setTime(alarmHours, alarmMinutes);
    watch.showTime();
    break;

  case AL_SET_MIN_STATE:
    updateBlink();
    watch.setTime(alarmHours, alarmMinutes);
    if(blinkVariable==HIGH)
      watch.showTime();//update the display so it blinks
    if(buttonEvent == buttonEvent1)
      state = AL_INC_MIN_STATE;//wait for the user to release the button in this state
    if(buttonEvent == buttonEvent2)
      state = AL_DEC_MIN_STATE;//wait for the user to release the button in this state
    if(buttonEvent == buttonEvent3)
      state = AL_EXIT_MIN_STATE;//wait for the user to release the button in this state
    break;

  case AL_INC_MIN_STATE:
    watch.setTime(alarmHours, alarmMinutes);
    watch.showTime();
    if(buttonEvent == noButtonEvent)//when the button is relesed
    {
      alarmMinutes = (alarmMinutes+1)%60;//increase the alarm minutes
      state = AL_SET_MIN_STATE;//go back to change the minutes again
    }
    if(buttonEvent == buttonEvent1Hold || buttonEvent == buttonEvent2Hold)//if the user holds button 1 or 2
      state = AL_SET_HOUR_STATE;//return to the main alarm setting state,where the alarm is turned off
    break;

  case AL_DEC_MIN_STATE:
    watch.setTime(alarmHours, alarmMinutes);
    watch.showTime();
    if(buttonEvent == noButtonEvent)//when the button is relesed
    {
      alarmMinutes = (alarmMinutes-1);//decrease the alarm minutes
      if(alarmMinutes < 0)
        alarmMinutes=59;
      state = AL_SET_MIN_STATE;//go back to change the minutes again
    }
    if(buttonEvent == buttonEvent1Hold || buttonEvent == buttonEvent2Hold)//if the user holds button 1 or 2
      state = AL_SET_HOUR_STATE;//return to the main alarm setting state,where the alarm is turned off
    break;

  case AL_EXIT_MIN_STATE:
    watch.setTime(alarmHours, alarmMinutes);
    watch.showTime();
    if(buttonEvent == noButtonEvent)//when no buttons are pressed
      state = AL_SET_HOUR_STATE;//change state to set the alarm hour
    if(buttonEvent == buttonEvent3Hold)//if button3 is held
        state = ENTER_DEFAULT_STATE;//return to the default state
    break;

  case ENTER_DEFAULT_STATE:
    if(buttonEvent == noButtonEvent)//wait until the buttons are released
      state = DEFAULT_STATE;//and go back to the default state
    break;

  default://if something unexpected happens
    state = DEFAULT_STATE;//go back to the default state (time display)
    break;
  }
}

void updateBlink(void)
{
  if(millis()%blinkRate>=blinkRate/2)
    blinkVariable=1;
  else
    blinkVariable=0;
}

void clockUpdate()
{
  lastClockTime=currentClockTime;//for when millis wraps around
  currentClockTime=millis();

  if(currentClockTime<lastTimeUpdated)//catch when the timer wraps around
      lastTimeUpdated-=lastClockTime;

  if(currentClockTime-oneMin>=lastTimeUpdated)//update the time
  {
    lastTimeUpdated+=oneMin;//update the counter

    minutes=(minutes+1)%60;//get the new time
    if (minutes==0)
    {
      hours=(hours+1)%(12);
      if(hours==0)
        if(AMPM==PM)
          AMPM=AM;
        else
          AMPM=PM;
    }
  }

}

void alarm(void)
{
  if(alarmOn == true)
  {
    //turn the alarm off if a button is pushed
    if(alarmPlaying)
      if(buttonEvent!=noButtonEvent)
        alarmPlaying=false;

    //see if the alarm should go off
    if(alarmHours==hours && alarmMinutes==minutes)
      if(alarmSounded==false && alarmAMPM==AMPM)
      {
        alarmPlaying=true;//turn the alarm on
        alarmSounded=true;//make sure it only goes off once per minute
      }

    if(alarmMinutes!=minutes)
      alarmSounded=false;//arm the alarm

    if(alarmPlaying)
      playTune();//sound the alarm
  }
}

void playTune(void)                     // play a tune . . .
{
  for(int j=0;j<numNotes;j++)
  {
    getUserInput();
    if(buttonEvent==noButtonEvent)
      if(songNote[j]>0)
      {
        toneOut(songNote[j],noteDuration[j]);
        //delay(et);
      }
      else
        delay(noteDuration[j]);
  } 
}

void toneOut(int pitch, int duration)  // pitch in Hz, duration in ms
{
  int delayPeriod;
  long cycles, i;

  delayPeriod = (500000 / pitch) - 7;   // calc 1/2 period in us -7 for overhead
  cycles = ((long)pitch * (long)duration) / 1000; // calc. number of cycles for loop

  for (i=0; i<= cycles; i++)           // play note for duration ms
  {
    digitalWrite(SPEAKER, HIGH);
    delayMicroseconds(delayPeriod);
    digitalWrite(SPEAKER, LOW);
    delayMicroseconds(delayPeriod - 1); // - 1 to make up for digitaWrite overhead
  }
}









