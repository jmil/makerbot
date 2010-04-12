#define MOTOR_DIR_PIN	8
#define MOTOR_SPEED_PIN	5
#define ROASTER_PIN		6

#define LOW_SUN_PIN		2
#define HIGH_SUN_PIN	3

int highSun = 0;
int lowSun = 0;
int motorSpeed = 0;

void setup()
{
	pinMode(MOTOR_DIR_PIN, OUTPUT);
	pinMode(MOTOR_SPEED_PIN, OUTPUT);
	pinMode(ROASTER_PIN, OUTPUT);
	
	digitalWrite(MOTOR_DIR_PIN, LOW);
	digitalWrite(MOTOR_SPEED_PIN, LOW);
        digitalWrite(ROASTER_PIN, 0);
        Serial.begin(9600);
        Serial.println("Start");
}


void loop()
{
	highSun = analogRead(HIGH_SUN_PIN);
	lowSun = analogRead(LOW_SUN_PIN);
	
	if (highSun > lowSun)
		digitalWrite(MOTOR_DIR_PIN, HIGH);
	else
		digitalWrite(MOTOR_DIR_PIN, LOW);
		
        motorSpeed = 60;
	motorSpeed = min(abs(highSun - lowSun), 255);
	analogWrite(MOTOR_SPEED_PIN, motorSpeed);
 //       delay(50);
//        analogWrite(MOTOR_SPEED_PIN, 0);
	//analogWrite(ROASTER_PIN, 255-motorSpeed);

   //   delay(100);
      
      /*
      Serial.print(highSun, DEC);
      Serial.print(" / ");
      Serial.println(lowSun, DEC);
      */
}
