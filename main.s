.thumb

.include "init/adresses.s"
.global _start                          @ Make start function global so the linker can see it later
.include "init/vectortable.s"

.thumb_func				                      @ Because of Thumb mode
_start:                                 @ Start Request Handler

.include "init/hardware.s"

bl    displayInit

ldr   r7, =0 @ ones of seconds
ldr   r6, =1 @ tens of seconds

bl    displayBegining

ldr   r0, = textReady
bl    displayPrint
bl    displaySecondline
ldr   r0, = textTime
bl    displayPrint

ldr   r0, = '0' @ disp tens of seconds
add   r0, r6
bl    displayPutchar
ldr   r0, = '0' @ disp ones of seconds
add   r0, r7
bl    displayPutchar

@ Main Loop

loop:
  
  bl    getchar
  mov   r1, r0
  ldr   r2, = 's'
  bl    byteCompare
  ldr   r1, = 1
  cmp   r0, r1
  bne   skipStarting
  ldr   r0, = textReady
  bl    printf
  bl    countdownStart
  skipStarting: 


b loop


@ Strings

.include "data/strings.s"

@ Functions

.include "functions/countdown.s"
.include "functions/display.s"
.include "functions/displayprint.s"
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
.include "irqhandlers/tim6.s"
