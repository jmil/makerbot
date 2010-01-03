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
    minutes = minutes / 5;
    mMinutesRow = (minutes % 6) + ROW0;
    mMinutesCol = (minutes / 6) + COL0;
 
    mHoursRow = (hours % 6) + ROW0;
    mHoursCol = (hours / 6) + COL2;
}
 
/* this method is suitable for calling in loop().  It shows both the
 * minute and hours LED for 5ms, for a total of 10ms. If you do
 * nothing but call this, the LEDs will have a 50% duty cycle with a
 * frequency of 100Hz. */
void MakerBotWatch::showTime()
{
    lightLED(mMinutesRow, mMinutesCol);
    delay(5);
    unlightLED(mMinutesRow, mMinutesCol);
 
    lightLED(mHoursRow, mHoursCol);
    delay(5);
    unlightLED(mHoursRow, mHoursCol);
}
