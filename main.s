.thumb

.include "init/adresses.s"
.global _start                          @ Make start function global so the linker can see it later
.include "init/vectortable.s"

.thumb_func				                      @ Because of Thumb mode
_start:                                 @ Start Request Handler

.include "init/hardware.s"

bl    displayInit

ldr   r7, = 30 @ Seconds

@ put here: display

@ Main Loop

loop:
  
  bl    getchar
  mov   r1, r0
  mov   r3, r0
  ldr   r2, = 's'
  bl    byteCompare
  ldr   r1, = 1
  cmp   r0, r1
  beq   skipRun
  ldr   r2, = '+'
  mov   r1, r3
  bl    byteCompare
  ldr   r1, = 1
  cmp   r0, r1
  beq   skipAdd
  ldr   r2, = '-'
  mov   r1, r3
  bl    byteCompare
  ldr   r1, = 1
  cmp   r0, r1
  beq   skipAdd

  skipRun: 
  ldr   r0, = textRun
  bl    printf
  bl    countdownStart
  b     loop    
  
  skipAdd: 
  add   r7, #1
  ldr   r0, = textS
  bl    printf
  ldr   r3, = #0
  b     loop

  skipSub: 
  sub   r7, #1
  ldr   r0, = textS
  bl    printf
  ldr   r3, = #0
  b     loop

b loop

textS:
  mov   r1,lr
  push  {r0-r7}

  ldr   r0, = textSet
  bl    printf

  bl    displayBegining

  ldr   r0, = textSet
  bl    displayPrint
  ldr   r0, = textTime
  bl    displayPrint

  ldr   r0, = '0' @ disp tens of seconds
  add   r0, r6
  bl    displayPutchar
  ldr   r0, = '0' @ disp ones of seconds
  add   r0, r7
  bl    displayPutchar

  pop   {r0-r7}
  mov   lr,r1
bx lr


@ Strings

.include "data/strings.s"

@ Functions

.include "functions/countdown.s"
.include "functions/display.s"
.include "functions/displayfunctions.s"
.include "functions/putchar.s"
.include "functions/getchar.s"
.include "functions/bytecompare.s"
.include "functions/setpins.s"
.include "functions/wait.s"
.include "functions/printf.s"

.ltorg @ Directive to move literal pool here

@ Interrupt Request Handlers

.include "irqhandlers/default.s"
.include "irqhandlers/nmi.s"
.include "irqhandlers/hardfault.s"
.include "irqhandlers/systick.s"
.include "irqhandlers/usart2.s"
.include "irqhandlers/tim6.s"

