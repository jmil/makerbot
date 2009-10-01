#ifndef HEATER_H
#define HEATER_H

#include <stdint.h>

void set_temperature(int temp);
int sample_temperature(uint8_t pin);

void manage_temperature();

#endif // HEATER_H
