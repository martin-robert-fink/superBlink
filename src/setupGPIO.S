# SPDX-License-Identifier: Unlicense
# Copyright (c) 2018 Western Digital Corporation or its affiliates.

.section .text
.align 2
.globl setupGPIO

.include "memory_map.inc"
.include "gpio.inc"

setupGPIO:
    addi sp, sp, -16            # Allocate Stack Frame
    sw ra, 12(sp)               # Save return address onto the stack

    li t0, GPIO_CTRL_ADDR       # Load the base GPIO address
    li t1, GPIO_RGB_PINS        # Get the RGP Pins offset
    sw t1, GPIO_OUTPUT_EN(t0)   # Enable RGB pins as output pins
    sw t1, GPIO_OUTPUT_XOR(t0)  # Set the XOR to that the pins are Active High
    sw x0, GPIO_OUTPUT_VAL(t0)  # Set all writable GPIO pins to zero

    lw ra, 12(sp)               # Restore the return address
    addi sp, sp, 16             # Deallocate stack frame
    ret 

    