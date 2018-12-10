# SPDX-License-Identifier: Unlicense
# Copyright (c) 2018 Western Digital Corporation or its affiliates.

.section .text
.align 2
.globl delay

.include "memory_map.inc"

# Our delay value in milliseconds passed into a0

delay:
    addi sp, sp, -16            # Setup our stack frame
    sw ra, 12(sp)               # Save return address

    li t0, MTIME                # Load the timer register
    lw t1, 0(t0)                # Load the current value of the timer

    li t2, MTIME_FREQUENCY      # Get our clock frequency
    mul t2, t2, a0              # Multiply milliseconds with frequency
    add t2, t1, t2              # Target mtime is now in t2

1:
    lw t1, 0(t0)                # read mtime value again
    blt t1, t2, 1b              # Keep looping until timout

    lw ra, 12(sp)               # Restore the return address
    addi sp, sp, 16             # Deallocate stack frame
    ret 

    