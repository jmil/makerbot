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

#include "MakerBotWatch.h"
 
MakerBotWatch watch;
 
void setup() {
}
 
void loop() {
  // speed up time by a factor of 600!!!
  uint32_t now = millis() / 100;
 
  // time runs at normal speed
  // uint32_t now = millis() / 60000;
 
  int8_t hours = (now / 60) % 12;
  int8_t minutes = now % 60;
  watch.setTime(hours, minutes);
  watch.showTime();
}
