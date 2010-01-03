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

/*
 * MakerbotWatch code modifier for reversed inner LEDs
 */

#include "MakerBotWatch.h"
#include "wiring.h"
 
MakerBotWatch::MakerBotWatch()
{
    pinMode(SPEAKER, OUTPUT);
    pinMode(BUTTON1, INPUT);
    pinMode(BUTTON2, INPUT);
    pinMode(BUTTON3, INPUT);
    clear();
}
 
void MakerBotWatch::clear()
{
    mHoursRow = mHoursCol = - 1;
    mMinutesRow = mMinutesCol = -1;
 
    for (int i = COL0; i <= ROW5; ++i) {
    pinMode(i, INPUT);
        digitalWrite(i, LOW);
    }
}
 
void MakerBotWatch::lightLED(int8_t rowNum, int8_t colNum)
{
#ifdef RESERVED_INNER_LEDS
    if (colNum == COL2 || colNum == COL3) {
    int8_t temp = rowNum;
    rowNum = colNum;
    colNum = temp;
    }
#endif
    digitalWrite(rowNum, HIGH);
    pinMode(rowNum, OUTPUT);
    digitalWrite(colNum, LOW);
    pinMode(colNum, OUTPUT);
}
 
void MakerBotWatch::unlightLED(int8_t rowNum, int8_t colNum)
{
    pinMode(rowNum, INPUT);
    digitalWrite(rowNum, LOW);
    pinMode(colNum, INPUT);
    digitalWrite(colNum, LOW);
}
 
void MakerBotWatch::setTime(int8_t hours, int8_t minutes)
{
	mMinutesOnes = minutes % 5;
    minutes = minutes / 5;
    mMinutesRow = (minutes % 6) + ROW0;
    mMinutesCol = (minutes / 6) + COL0;
 
    mHoursRow = (hours % 6) + ROW0;
    mHoursCol = (hours / 6) + COL2;
}
 
/* this method is suitable for calling in loop().  It shows the
 * minute and hours LEDs for 3ms, for a total of 9ms (2 minutes). If you do
 * nothing but call this, the LEDs will have a 30% duty cycle with a
 * frequency of 100Hz. */
void MakerBotWatch::showTime()
{
    if(mMinutesOnes>0)
	{
	    if(mMinutesOnes>=1)
            lightLED(LED_A);
        if(mMinutesOnes>=2)
            lightLED(LED_B);
        if(mMinutesOnes>=3)
            lightLED(LED_C);
        if(mMinutesOnes>=4)
            lightLED(LED_D);
        delay(3);
        if(mMinutesOnes>=1)
            unlightLED(LED_A);
        if(mMinutesOnes>=2)
            unlightLED(LED_B);
        if(mMinutesOnes>=3)
            unlightLED(LED_C);
        if(mMinutesOnes>=4)
            unlightLED(LED_D);
	}
	
    lightLED(mMinutesRow, mMinutesCol);
    delay(3);
    unlightLED(mMinutesRow, mMinutesCol);
 
    lightLED(mHoursRow, mHoursCol);
    delay(3);
    unlightLED(mHoursRow, mHoursCol);
}
