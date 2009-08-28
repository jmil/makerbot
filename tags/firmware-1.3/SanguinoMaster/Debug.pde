#ifdef ENABLE_DEBUG

/*
void square_move()
{
  queue_absolute_point(100, -100, 0, 2, 20833);
  Serial.println("Bottom right");
  queue_absolute_point(100, -100, 300, 2, 10000);
  Serial.println("Up");
  queue_absolute_point(100, 100, 300, 2, 20833);
  Serial.println("Top right");
  queue_absolute_point(-100, 100, 300, 2, 20833);
  Serial.println("Top left");
  queue_absolute_point(-100, 100, 0, 2, 10000);
  Serial.println("Down");
  queue_absolute_point(-100, -100, 0, 2, 20833);
  Serial.println("Bottom left");
}

void circle_move()
{
  int x, y;
  float rads;
  
  for (int i=0; i<100; i++)
  {
    rads = 2*PI*(i/100.0);

    x = 200 * sin(rads);
    y = 200 * cos(rads);
    
    queue_absolute_point(x, y, 0, 1, 60000);
  }
}
*/

void debug_blink()
{
  digitalWrite(DEBUG_PIN, HIGH);
  digitalWrite(DEBUG_PIN, LOW);
}

void check_tool_version(byte id)
{
  ping_tool(id);

  int version = slavePacket.get_16(1);

  //print_tool(id);
  //Serial.print("version: ");
  //Serial.println(version);
}

void exercise_heater()
{
  set_tool_temp(1, 100);
  while (1)
  {
    get_tool_temp(1);
    delay(500);
  }
}

void exercise_motors()
{
  boolean dir = true;

  Serial.println("forward");
  Serial.println("up");
  for (int i=0; i<256; i++)
  {
    set_motor1_pwm(1, i);
    toggle_motor1(1, dir, 1);
    set_motor2_pwm(1, i);
    toggle_motor2(1, dir, 1);
    Serial.println(i, DEC);
  }

  Serial.println("down");
  for (int i=255; i>=0; i--)
  {
    set_motor1_pwm(1, i);
    toggle_motor1(1, dir, 1);
    set_motor2_pwm(1, i);
    toggle_motor2(1, dir, 1);
    Serial.println(i, DEC);
  }

  dir = false;

  Serial.println("forward");
  Serial.println("up");
  for (int i=0; i<256; i++)
  {
    set_motor1_pwm(1, i);
    toggle_motor1(1, dir, 1);
    set_motor2_pwm(1, i);
    toggle_motor2(1, dir, 1);
    Serial.println(i, DEC);
  }

  Serial.println("down");
  for (int i=255; i>=0; i--)
  {
    set_motor1_pwm(1, i);
    toggle_motor1(1, dir, 1);
    set_motor2_pwm(1, i);
    toggle_motor2(1, dir, 1);
    Serial.println(i, DEC);
  }
}

void print_stats()
{
  Serial.println("Stats:");
  Serial.print("Slave TX Count:");
  Serial.println(rs485_tx_count, DEC);
  Serial.print("Slave RX Count:");
  Serial.println(rs485_rx_count, DEC);
  Serial.print("Slave Packet Count: ");
  Serial.println(rs485_packet_count, DEC);
  Serial.print("Slave CRC Errors: ");
  Serial.println(slave_crc_errors, DEC);
  Serial.print("Slave timeouts: ");
  Serial.println(slave_timeouts, DEC);
}

void print_tool(byte id)
{
  Serial.print("tool #");
  Serial.print(id, DEC);
  Serial.print(" ");
}

void get_tool_temp(byte id)
{
  slavePacket.init();
  slavePacket.add_8(id);
  slavePacket.add_8(SLAVE_CMD_GET_TEMP);
  send_packet();

  int temp = slavePacket.get_16(1);
  print_tool(id);
  Serial.print("temp: ");
  Serial.println(temp, DEC);
}

void set_tool_temp(byte id, unsigned int temp)
{
  slavePacket.init();
  slavePacket.add_8(id);
  slavePacket.add_8(SLAVE_CMD_SET_TEMP);
  slavePacket.add_16(temp);
  send_packet();

  print_tool(id);
  Serial.print("set temp to: ");
  Serial.println(temp, DEC);
}

void set_motor1_pwm(byte id, byte pwm)
{
  slavePacket.init();
  slavePacket.add_8(id);
  slavePacket.add_8(SLAVE_CMD_SET_MOTOR_1_PWM);
  slavePacket.add_8(pwm);
  send_packet();

  //print_tool(id);
  //Serial.print("set motor1 pwm to: ");
  //Serial.println(pwm, DEC);
}

void set_motor2_pwm(byte id, byte pwm)
{
  slavePacket.init();
  slavePacket.add_8(id);
  slavePacket.add_8(SLAVE_CMD_SET_MOTOR_2_PWM);
  slavePacket.add_8(pwm);
  send_packet();

  //print_tool(id);
  //Serial.print("set motor2 pwm to: ");
  //Serial.println(pwm, DEC);
}


void set_motor1_rpm(byte id, int rpm)
{

}

void toggle_motor1(byte id, boolean dir, boolean enable)
{
  byte flags = 0;

  if (enable)
    flags += 1;

  if (dir)
    flags += 2;

  slavePacket.init();
  slavePacket.add_8(id);
  slavePacket.add_8(SLAVE_CMD_TOGGLE_MOTOR_1);
  slavePacket.add_8(flags);
  send_packet();
}

void toggle_motor2(byte id, boolean dir, boolean enable)
{
  byte flags = 0;

  if (enable)
    flags += 1;

  if (dir)
    flags += 2;

  slavePacket.init();
  slavePacket.add_8(id);
  slavePacket.add_8(SLAVE_CMD_TOGGLE_MOTOR_2);
  slavePacket.add_8(flags);
  send_packet();
}

void toggle_fan(byte id, boolean enable)
{
  slavePacket.init();
  slavePacket.add_8(id);
  slavePacket.add_8(SLAVE_CMD_TOGGLE_FAN);
  slavePacket.add_8(enable);
  send_packet();
}

void toggle_valve(byte id, boolean open)
{
  slavePacket.init();
  slavePacket.add_8(id);
  slavePacket.add_8(SLAVE_CMD_TOGGLE_VALVE);
  slavePacket.add_8(open);
  send_packet();
}

void get_motor1_pwm(byte id)
{
  slavePacket.init();
  slavePacket.add_8(id);
  slavePacket.add_8(SLAVE_CMD_GET_MOTOR_1_PWM);
  send_packet();

  byte temp = slavePacket.get_8(1);
  print_tool(id);
  Serial.print("m1 pwm: ");
  Serial.println(temp, DEC);
}

void get_motor2_pwm(byte id)
{
  slavePacket.init();
  slavePacket.add_8(id);
  slavePacket.add_8(SLAVE_CMD_GET_MOTOR_2_PWM);
  send_packet();

  byte temp = slavePacket.get_8(1);
  print_tool(id);
  Serial.print("m2 pwm: ");
  Serial.println(temp, DEC);
}

void set_servo1_position(byte id, byte pos)
{
  slavePacket.init();
  slavePacket.add_8(id);
  slavePacket.add_8(SLAVE_CMD_SET_SERVO_1_POS);
  slavePacket.add_8(pos);
  send_packet();
}

void set_servo2_position(byte id, byte pos)
{
  slavePacket.init();
  slavePacket.add_8(id);
  slavePacket.add_8(SLAVE_CMD_SET_SERVO_2_POS);
  slavePacket.add_8(pos);
  send_packet();
}

void get_motor1_rpm(byte id)
{

}

void get_filament_status(byte id)
{
  slavePacket.init();
  slavePacket.add_8(id);
  slavePacket.add_8(SLAVE_CMD_FILAMENT_STATUS);
  send_packet();

  byte temp = slavePacket.get_8(1);
  print_tool(id);
  Serial.print("filament: ");
  Serial.println(temp, DEC);
}

void test_rs485()
{
  for (byte j=0; j<5; j++)
  {
    Serial.print("starting round ");
    Serial.println(j, DEC);

    for (int i=0; i<=255; i++)
    {
      set_i(i);
      delay(50);
    }

    delay(1000);

    for (int i=255; i>=0; i--)
    {
      set_i(i);
      delay(50);
    }

    delay(1000);
  }

  print_stats();
}

void set_i(byte i)
{
  set_motor1_pwm(0, i);
  toggle_motor1(0, true, true);
  set_motor2_pwm(0, i);
  toggle_motor2(0, true, true);

  if (i>127)
  {
    toggle_fan(0, true);
    toggle_valve(0, true);
  }
  else
  {
    toggle_fan(0, false);
    toggle_valve(0, false);
  }
}

#endif
