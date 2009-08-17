#include <EEPROM.h>

// Yep, this is actually -*- c++ -*-

// Prototype of fn defined in Tools.pde
void send_tool_command(CircularBuffer::Cursor& cursor);

//initialize the firmware to default state.
inline void init_commands()
{
  finishedCommands = 0;
}

//handle our packets.
void process_host_packets()
{
  unsigned long start = millis();
  unsigned long end = start + PACKET_TIMEOUT;

#ifdef ENABLE_COMMS_DEBUG
    //Serial.print("IN: ");
#endif

  //do we have a finished packet?
  while (!hostPacket.isFinished())
  {
    if (Serial.available() > 0)
    {
      digitalWrite(DEBUG_PIN, HIGH);

      //grab a byte and process it.
      byte d = Serial.read();
      hostPacket.process_byte(d);

#ifdef ENABLE_COMMS_DEBUG
      //Serial.print(d, HEX);
      //Serial.print(" ");
#endif
      serial_rx_count++;

      //keep us goign while we have data coming in.
      start = millis();
      end = start + PACKET_TIMEOUT;

      if (hostPacket.getResponseCode() == RC_CRC_MISMATCH)
      {
        //host_crc_errors++;

#ifdef ENABLE_COMMS_DEBUG
        Serial.println("Host CRC Mismatch");
#endif
      }

      digitalWrite(DEBUG_PIN, LOW);
    }

    //are we sure we wanna break mid-packet?
    //have we timed out?
    if (millis() >= end)
    {
#ifdef ENABLE_COMMS_DEBUG
      Serial.println("Host timeout");
#endif
      break;  
    }
  }

  if (hostPacket.isFinished())
  {
    serial_packet_count++;

    byte b = hostPacket.get_8(0);
    // top bit high == bufferable command packet (eg. #128-255)
    if (b & 0x80)
    {
      //do we have room?
      if (commandBuffer.remainingCapacity() >= hostPacket.getLength())
      {
        //okay, throw it in the buffer.
        for (byte i=0; i<hostPacket.getLength(); i++)
          commandBuffer.append(hostPacket.get_8(i));
      }
      else
      {
        hostPacket.overflow();
      }
    }
    // top bit low == reply needed query packet (eg. #0-127)
    else
      handle_query(b);
  }

  //okay, send our response
  hostPacket.sendReply();
}

//this is for handling query commands that need a response.
void handle_query(byte cmd)
{
  //which one did we get?
  switch (cmd)
  {
    //WORKS
    case HOST_CMD_VERSION:
      //get our host version
      host_version = hostPacket.get_16(1);

      //send our version back.
      hostPacket.add_16(FIRMWARE_VERSION);
      break;

    //WORKS
    case HOST_CMD_INIT:
      //just initialize
      initialize();
      break;

    case HOST_CMD_GET_BUFFER_SIZE:
      //send our remaining buffer size.
      hostPacket.add_16(commandBuffer.remainingCapacity());
      break;

    case HOST_CMD_CLEAR_BUFFER:
      //just clear it.
      commandBuffer.clear();
      break;

    case HOST_CMD_GET_POSITION:
      //send our position
      hostPacket.add_32(current_steps.x);
      hostPacket.add_32(current_steps.y);
      hostPacket.add_32(current_steps.z);
      hostPacket.add_8(get_endstop_states());
      break;

    case HOST_CMD_GET_RANGE:
      //send our range
      hostPacket.add_32(range_steps.x);
      hostPacket.add_32(range_steps.y);
      hostPacket.add_32(range_steps.z);
      break;

    case HOST_CMD_SET_RANGE:
      //set our range to what the host tells us
      range_steps.x = (long)hostPacket.get_32(1);
      range_steps.y = (long)hostPacket.get_32(5);
      range_steps.z = (long)hostPacket.get_32(9);

      //write it back to eeprom
      write_range_to_eeprom();
      break;

    case HOST_CMD_ABORT:
      //support a microcontrollers right to choice.
      abort_print();
      break;

    case HOST_CMD_PAUSE:
      if (is_machine_paused)
      {
        //unpause our machine.
        is_machine_paused = false;

        //unpause our tools
        set_tool_pause_state(false);

        //resume stepping.
        enable_needed_steppers();
        enableTimer1Interrupt();
      }
      else
      {
        //pause our activity.
        is_machine_paused = true;

        //pause our tools
        set_tool_pause_state(true);

        //pause stepping
        disableTimer1Interrupt();
        disable_steppers();
      }
      break;

    case HOST_CMD_PROBE:
      //we dont support this yet.
      hostPacket.unsupported();
      break;

    //WORKS
    case HOST_CMD_TOOL_QUERY:
      send_tool_query();
      break;

  case HOST_CMD_IS_FINISHED:
    {
      bool finished = is_point_buffer_empty() && at_target() && commandBuffer.size() == 0;
      hostPacket.add_8(finished?1:0);
      break;
    }

  case HOST_CMD_READ_EEPROM:
    {
      const uint16_t offset = hostPacket.get_16(1);
      const uint8_t count = hostPacket.get_8(3);
      if (count > 16) {
	hostPacket.overflow();
      } else {
	for (uint8_t i = 0; i < count; i++) {
	  hostPacket.add_8(EEPROM.read(offset+i));
	}
      }
    }
    break;
  case HOST_CMD_WRITE_EEPROM:
    {
      uint16_t offset = hostPacket.get_16(1);
      uint8_t count = hostPacket.get_8(3);
      if (count > 16) {
	hostPacket.overflow();
      } else {
	for (uint8_t i = 0; i < count; i++) {
	  EEPROM.write(offset+i,hostPacket.get_8(4+i));
	}
	hostPacket.add_8(count);
      }
    }
    break;
  default:
      hostPacket.unsupported();
  }
}

//this is for handling buffered commands with no response
void handle_commands()
{
  byte flags = 0;
  
  long x;
  long y;
  long z;
  unsigned long step_delay;
  byte cmd;

  //do we have any commands?
  if (commandBuffer.size() > 0)
  {
    CircularBuffer::Cursor cursor = commandBuffer.newCursor();
    
    uint16_t index = 0;

    cmd = cursor.read_8();

    // Do it later if it's a point queueing command and we don't have room yet.
    if ((cmd == HOST_CMD_QUEUE_POINT_ABS /* || cmd == HOST_CMD_QUEUE_POINT_INC */) && 
	pointBuffer.remainingCapacity() < POINT_SIZE) {
      return;
    }

    switch(cmd)
    {
      case HOST_CMD_QUEUE_POINT_ABS:
        x = (long)cursor.read_32();
        y = (long)cursor.read_32();
        z = (long)cursor.read_32();
        step_delay = (unsigned long)cursor.read_32();
          
        queue_absolute_point(x, y, z, step_delay);
      
        break;

      case HOST_CMD_SET_POSITION:
	// Belay until we're at a good location.
	if (!is_point_buffer_empty()) { return; }
	cli();
        target_steps.x = current_steps.x = (long)cursor.read_32();
        target_steps.y = current_steps.y = (long)cursor.read_32();
        target_steps.z = current_steps.z = (long)cursor.read_32();
	sei();
        break;

      case HOST_CMD_FIND_AXES_MINIMUM:
	// Belay until we're at a good location.
	if (!is_point_buffer_empty()) { return; }

        //no dda interrupts.
        disableTimer1Interrupt();

        //which ones are we going to?
        flags = cursor.read_8();

        //find them!
        seek_minimums(
          flags & 1,
          flags & 2,
          flags & 4,
          cursor.read_32(),
          cursor.read_16());

        //turn on point seeking agian.
        enableTimer1Interrupt();

        break;

      case HOST_CMD_FIND_AXES_MAXIMUM:
	// Belay until we're at a good location.
	if (!is_point_buffer_empty()) { return; }

        //no dda interrupts.
        disableTimer1Interrupt();

        //find them!
        seek_maximums(
          flags & 1,
          flags & 2,
          flags & 4,
          cursor.read_32(),
          cursor.read_16());

        //turn on point seeking agian.
        enableTimer1Interrupt();

        break;

      case HOST_CMD_DELAY:
	// Belay until we're at a good location.
	if (!is_point_buffer_empty()) { return; }

        //take it easy.
        delay(cursor.read_32());
        break;

      case HOST_CMD_CHANGE_TOOL:
	// Belay until we're at a good location.
	if (!is_point_buffer_empty()) { return; }

        //extruder, i choose you!
        select_tool(cursor.read_8());
        break;

      case HOST_CMD_WAIT_FOR_TOOL:
	// Belay until we're at a good location.
	if (!is_point_buffer_empty()) { return; }

        //get your temp in gear, you lazy bum.
        
        //what tool / timeout /etc?
        currentToolIndex = cursor.read_8();
        toolPingDelay = (unsigned int)cursor.read_16();
        toolTimeout = (unsigned int)cursor.read_16();

        //check to see if its ready now
        if (!is_tool_ready(currentToolIndex))
        {
          //how often to ping?
          toolNextPing = millis() + toolPingDelay;
          toolTimeoutEnd = millis() + (toolTimeout * 1000);
          
          //okay, put us in ping-tool-until-ready mode
          commandMode = COMMAND_MODE_WAIT_FOR_TOOL;
        }
        break;

      case HOST_CMD_TOOL_COMMAND:
	// Belay until we're at a good location.
	if (!is_point_buffer_empty()) { return; }
        
        send_tool_command(cursor);
        break;
    case HOST_CMD_ENABLE_AXES:
      // Belay until we're at a good location.
      if (!is_point_buffer_empty()) { return; }
      {
	unsigned char param = cursor.read_8();
	bool x = (param & 0x01) != 0;
	bool y = (param & 0x02) != 0;
	bool z = (param & 0x04) != 0;
	if ((param & 0x80) != 0) {
	  // enable axes
	  enable_steppers(x,y,z);
	} else {
	  // disable axes
	  disable_steppers(x,y,z);
	}
      }
      default:
        hostPacket.unsupported();
    }
    cursor.commit();
  }
}
