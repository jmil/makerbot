/*
  LiquidCrystal Library - setCursor
 
 Demonstrates the use a 16x2 LCD display.  The LiquidCrystal
 library works with all LCD displays that are compatible with the 
 Hitachi HD44780 driver. There are many of them out there, and you
 can usually tell them by the 16-pin interface.
 
 This sketch prints to all the positions of the LCD using the
 setCursor(0 method:
 
  The circuit:
 * LCD RS pin to digital pin 12 / 17
 * LCD Enable pin to digital pin 11 / 16
 * LCD D4 pin to digital pin 5 / 9
 * LCD D5 pin to digital pin 4 / 53
 * LCD D6 pin to digital pin 3 / 10
 * LCD D7 pin to digital pin 2 / 11
 * 10K resistor:
 * ends to +5V and ground
 * wiper to LCD VO pin (pin 3)
 
 Library originally added 18 Apr 2008
 by David A. Mellis
 library modified 5 Jul 2009
 by Limor Fried (http://www.ladyada.net)
 example added 9 Jul 2009
 by Tom Igoe 
  modified 25 July 2009
 by David A. Mellis
 
 http://www.arduino.cc/en/Tutorial/LiquidCrystal
 */

// include the library code:
#include <LiquidCrystal.h>

// these constants won't change.  But you can change the size of
// your LCD using them:
const int numRows = 4;
const int numCols = 16;

#define OK_PIN 6
#define CANCEL_PIN 7
#define FOO_PIN 8
#define XMAX_PIN 34
#define XMIN_PIN 35
#define YMAX_PIN 20
#define YMIN_PIN 21
#define ZMAX_PIN 46
#define ZMIN_PIN 47
#define ZERO_PIN 48
#define BAR_PIN 49
#define DEBUG_PIN 13

// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(17, 16, 9, 53, 10, 11);

void setup() {
  // set up the LCD's number of rows and columns: 
  lcd.begin(numRows, numCols);
  
  pinMode(OK_PIN, INPUT);
  pinMode(CANCEL_PIN, INPUT);
  pinMode(ZERO_PIN, INPUT);
  pinMode(XMAX_PIN, INPUT);
  pinMode(XMIN_PIN, INPUT);
  pinMode(YMAX_PIN, INPUT);
  pinMode(YMIN_PIN, INPUT);
  pinMode(ZMAX_PIN, INPUT);
  pinMode(ZMIN_PIN, INPUT);

  pinMode(FOO_PIN, OUTPUT);
  pinMode(BAR_PIN, OUTPUT);
  pinMode(DEBUG_PIN, OUTPUT);
  digitalWrite(FOO_PIN, LOW);
  digitalWrite(BAR_PIN, LOW);
  digitalWrite(DEBUG_PIN, LOW);
}

void loop() {

/*
  digitalWrite(FOO_PIN, HIGH);
  delay(100);
  digitalWrite(FOO_PIN, LOW);
  delay(100);
*/


/*
  digitalWrite(BAR_PIN, HIGH);
  delay(100);
  digitalWrite(BAR_PIN, LOW);
  delay(100);
*/

/*
  digitalWrite(DEBUG_PIN, HIGH);
  delay(100);
  digitalWrite(DEBUG_PIN, LOW);
  delay(100);
*/
  

  if(!digitalRead(OK_PIN))
  {
    lcd.print("ok!");
    digitalWrite(FOO_PIN, HIGH);
  }
  else
    digitalWrite(FOO_PIN, LOW);

  if(!digitalRead(CANCEL_PIN))
  {
    lcd.print("cancel!");
    digitalWrite(BAR_PIN, HIGH);
  }
  else
    digitalWrite(BAR_PIN, LOW);
  
  if(!digitalRead(ZERO_PIN))
  {
    lcd.print("zero");
    digitalWrite(DEBUG_PIN, HIGH);
  }
  else
    digitalWrite(DEBUG_PIN, LOW);
  
  if(!digitalRead(XMAX_PIN))
    lcd.print("X+");
  if(!digitalRead(XMIN_PIN))
    lcd.print("X-");
  if(!digitalRead(YMAX_PIN))
    lcd.print("Y+");
  if(!digitalRead(YMIN_PIN))
    lcd.print("Y-");
  if(!digitalRead(ZMAX_PIN))
    lcd.print("Z+");
  if(!digitalRead(ZMIN_PIN))
    lcd.print("Z-");
}


