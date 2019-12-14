.thumb

.include "init/adresses.s"
.include "init/symbols.s"
.global _start                          @ Make start function global so the linker can see it later
.include "init/vectortable.s"

.thumb_func				                @ Because of Thumb mode
_start:                                 @ Start Request Handler

.include "init/hardware.s"

ldr r7, = 0
ldr r6, = 1

@ Main Loop

loop:

  bl    getchar
  mov   r3, r0
  mov   r1, r0
  ldr   r2, = '1'
  bl    byteCompare
  ldr   r1, = 1
  cmp   r1, r0
  bne   skipToTwo
  ldr   r0, = text1
  bl    printf
  skipToTwo:
  mov   r1, r3
  ldr   r2, = '3'
  bl    byteCompare
  ldr   r1, = 1
  cmp   r1, r0
  bne   skipToThree
  ldr   r0, = text2
  bl    printf
  skipToThree:
  mov   r1, r3
  ldr   r2, = '5'
  bl    byteCompare
  ldr   r1, = 1
  cmp   r1, r0
  bne   skipToFour
  ldr   r0, = text3
  bl    printf
  skipToFour:
  mov   r1, r3
  ldr   r2, = '7'
  bl    byteCompare
  ldr   r1, = 1
  cmp   r1, r0
  bne   loop
  ldr   r0, = text4
  bl    printf
b loop


@ Strings

.include "data/strings.s"

@ Functions

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
