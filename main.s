.thumb

.include "init/adresses.s"
.global _start                          @ Make start function global so the linker can see it later
.include "init/vectortable.s"

.thumb_func				                      @ Because of Thumb mode
_start:                                 @ Start Request Handler

.include "init/hardware.s"

bl    displayInit

ldr   r6, = 0x5 @ Seconds
mov   r7, r6


ldr   r0, = textReady
bl    display

@ Main Loop

loop:
  
  bl    getchar
  mov   r1, r0
  mov   r3, r0
  ldr   r2, = 's'
  bl    byteCompare
  ldr   r1, = 1
  cmp   r0, r1
  beq   jumpToRun
  ldr   r2, = '+'
  mov   r1, r3
  bl    byteCompare
  ldr   r1, = 1
  cmp   r0, r1
  beq   jumpToAdd
  ldr   r2, = '-'
  mov   r1, r3
  bl    byteCompare
  ldr   r1, = 1
  cmp   r0, r1
  beq   jumpToSub
  ldr   r2, = 'c'
  mov   r1, r3
  bl    byteCompare
  ldr   r1, = 1
  cmp   r0, r1
  beq   jumpToConfirm
b loop

  jumpToRun: 
  bl    countdownStart
  b     loop    
  
  jumpToAdd: 
  bl    incrementTime
  b     loop    

  jumpToSub: 
  bl    decrementTime
  b     loop  

  jumpToConfirm: 
  bl    confirmTime
  b     loop     
  
b loop

@ Strings

.include "data/strings.s"

@ Functions

.ltorg @ Directive to move literal pool here
.include "functions/time.s"
.include "functions/display.s"
.include "functions/displayfunctions.s"
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
