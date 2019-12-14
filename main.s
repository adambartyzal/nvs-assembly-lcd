.thumb

.include "init/adresses.s"
.global _start                          @ Make start function global so the linker can see it later
.include "init/vectortable.s"

.thumb_func				                      @ Because of Thumb mode
_start:                                 @ Start Request Handler

.include "init/hardware.s"

bl    displayInit

@ Main Loop

loop:

  bl    getchar

  mov   r1, r0
  mov   r7, r0
  ldr   r2, = 8
  bl    byteCompare
  ldr   r1, = 1
  cmp   r0, r1
  bne   skipClearing
  bl    displayBegining
  bl    loop
  skipClearing: 
  mov   r0, r7
  bl    displayPutchar

b loop


@ Strings

.include "data/strings.s"

@ Functions

.include "functions/display.s"
.include "functions/putchar.s"
.include "functions/getchar.s"
.include "functions/bytecompare.s"
.include "functions/setpins.s"
.include "functions/wait.s"
.include "functions/printf.s"

@ Interrupt Request Handlers

.include "irqhandlers/default.s"
.include "irqhandlers/nmi.s"
.include "irqhandlers/hardfault.s"
.include "irqhandlers/systick.s"
.include "irqhandlers/usart2.s"
