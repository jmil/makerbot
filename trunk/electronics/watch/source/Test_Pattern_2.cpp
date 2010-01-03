/*
 * MakerBotWatch - Open Hardware LED Wrist Watch
 * Copyright (C) 2009-2010 by Bre Pettis <bre@makerbot.com>
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

void allOff() {
  for(int i=3; i<8; i++) { 
    digitalWrite(i, HIGH); 
  }
  for ( int i = 8; i < 14; i++) { 
   digitalWrite(i,LOW); 
  }
}
 
void setup()   {
  // initialize the digital pin as an output:
  for(int i=3; i<14; i++)
  {
    pinMode(i, OUTPUT);
  }
  allOff(); 
}
// the loop() method runs over and over again,
// as long as the Arduino has power
 
void loop() {
  for (int column = 3; column < 8; column++) {
    for (int  row = 8; row <  14; row++) {
      allOff();
      digitalWrite(row,HIGH);
      digitalWrite(column,LOW);
      delay(500);
    }
  }
}
