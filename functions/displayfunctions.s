@ Display functions:

@ Display Print Function
@ call with r0 = string label

displayPrint:
  mov   r1,lr
  push  {r1-r7}

  next:

  ldrb  r1,[r0]
  mov   r3, r0
  mov   r4, r1
  ldrb  r2, = 0
  bl    byteCompare
  ldr   r1, =1  @ to check if result was 1
  cmp   r0, r1
  beq   displyPrintEnd
  mov   r0, r4
  bl    displayPutchar
  mov   r0, r3
  add   r0, #1
  b     next

  displyPrintEnd:

  pop   {r1-r7}
  mov   lr,r1
bx lr

@ putchar function with HD driver
@ r0 = char byte

displayPutchar:
  mov   r1,lr
  push  {r0-r7}
  ldr   r1, = GPIOC_ODR
  str   r0, [r1] 
  bl    tick
  pop   {r0-r7}
  mov   lr,r1
bx lr

@ Set display to listening to chars 
@ void

displayWrite:
  mov   r0,lr
  push  {r0-r7}
  ldr   r0, = 4
  bl    setPinUpPortA
  pop   {r0-r7}
  mov   lr,r0
bx lr

@ Set display to listening to instructions
@ void

displaySet:
  mov   r0,lr
  push  {r0-r7}
  ldr   r0, = 4
  bl    setPinDownPortA
  pop   {r0-r7}
  mov   lr,r0
bx lr

@ Jump to first line
@ void

displayFirstline:
  mov   r0,lr
  push  {r0-r7}
  bl    displaySet
  ldr   r0, = 0
  bl    displayPutchar
  bl    displayWrite
  pop   {r0-r7}
  mov   lr,r0
bx lr

@ Jump to second line
@ void

displaySecondline:
  mov   r0,lr
  push  {r0-r7}
  bl    displaySet
  ldr   r0, = 0xc0
  bl    displayPutchar
  bl    displayWrite
  pop   {r0-r7}
  mov   lr,r0
bx lr

@ Jump to begining of line
@ void

displayBegining:
  mov   r0,lr
  push  {r0-r7}

  bl    displaySet
  ldr   r0, = 1
  bl    displayPutchar
  bl    displayWrite

  pop   {r0-r7}
  mov   lr,r0
bx lr

@ Startup fcn of HD driver
@ void

displayInit:
  mov   r0,lr
  push  {r0-r7}

  bl    wait
  bl    wait  @ init of disply takes time
  bl    displaySet

  ldr   r0, = 0b00111000
  bl    displayPutchar
  ldr   r0, = 0b00001110
  bl    displayPutchar
  ldr   r0, = 0b00000110
  bl    displayPutchar

  ldr   r0, = 1
  bl    displayPutchar
  bl    displayWrite

  pop   {r0-r7}
  mov   lr,r0
bx lr

@ Generation of clock impulse on PA1 to redraw display
@ void

tick: 
  mov   r0,lr
  push  {r0-r7}

  ldr   r0, = 1
  bl    setPinUpPortA
  bl    wait2
  ldr   r0, = 1
  bl    setPinDownPortA
  bl    wait2

  pop   {r0-r7}
  mov   lr,r0
bx lr
