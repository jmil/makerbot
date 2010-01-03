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
 * MakerbotWatch definitions and class
 */
 
#ifndef MAKERBOTWATCH_H_
#define MAKERBOTWATCH_H_ 1
 
#include <stdint.h>
 
/* piezo speaker is attached to pin #2 */
 
#define SPEAKER 2
 
/* input buttons are attached to analog inputs, so use
 * analogRead() to get their values. */
 
#define BUTTON1    18  /* S1 is at 10 o'clock */
#define BUTTON2    19  /* S2 is at 7 o'clock */
#define BUTTON3    17  /* S3 is near 4 o'clock */
 
/* to light a LED, set the row to HIGH and the column to LOW.  To turn
 * off all LEDs, set all of the columns to HIGH and all of the rows to
 * LOW. */
 
#define COL0    3
#define COL1    4
#define COL2    5
#define COL3    6
#define COL4    7
 
#define ROW0    8
#define ROW1    9
#define ROW2    10
#define ROW3    11
#define ROW4    12
#define ROW5    13
 
/* these define the ROW, COL values for the outer and inner LEDs at
 * each of the 12 clock positions.  In these macros, 0 o'clock is the
 * same as 12 o'clock. */
 
#define OUTER_0     ROW0, COL0
#define OUTER_1     ROW1, COL0
#define OUTER_2     ROW2, COL0
#define OUTER_3     ROW3, COL0
#define OUTER_4     ROW4, COL0
#define OUTER_5     ROW5, COL0
#define OUTER_6     ROW0, COL1
#define OUTER_7     ROW1, COL1
#define OUTER_8     ROW2, COL1
#define OUTER_9     ROW3, COL1
#define OUTER_10    ROW4, COL1
#define OUTER_11    ROW5, COL1
#define OUTER_12    ROW0, COL0
 
#define INNER_0     ROW0, COL2
#define INNER_1     ROW1, COL2
#define INNER_2     ROW2, COL2
#define INNER_3     ROW3, COL2
#define INNER_4     ROW4, COL2
#define INNER_5     ROW5, COL2
#define INNER_6     ROW0, COL3
#define INNER_7     ROW1, COL3
#define INNER_8     ROW2, COL3
#define INNER_9     ROW3, COL3
#define INNER_10    ROW4, COL3
#define INNER_11    ROW5, COL3
#define INNER_12    ROW0, COL2
 
/* LEDs A-D are defined with A being closest to 12 o'clock */
#define LED_A       ROW3, COL4
#define LED_B       ROW2, COL4
#define LED_C       ROW1, COL4
#define LED_D       ROW0, COL4
 
class MakerBotWatch
{
public:
    MakerBotWatch();
    void clear();
 
    void lightLED(int8_t rowNum, int8_t colNum);
    void unlightLED(int8_t rowNum, int8_t colNum);
 
    void showTime();
    void setTime(int8_t hours, int8_t minutes);
 
private:
    int8_t mHoursRow, mHoursCol;
    int8_t mMinutesRow, mMinutesCol, mMinutesOnes;
};
 
#endif // MAKERBOTWATCH_H_
