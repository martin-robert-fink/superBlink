// SPDX-License-Identifier: Unlicense
// Copyright (c) 2018 Western Digital Corporation or its affiliates.

#include <stdio.h>
#include "superBlink.h"

int main()
{
    int error = 0;
    int ledNum = 0;
    int colors[NUM_LEDS] = {GREEN_LED, RED_LED, BLUE_LED};

    setupGPIO();

    while(!error) {
        setLED(colors[ledNum], ON);
        delay(DELAY);
        error = setLED(colors[ledNum++], OFF);
        delay(DELAY);
        if (ledNum >= NUM_LEDS)
            ledNum = 0;
    }
}