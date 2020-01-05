@ Timer functions

@ Turns on and resets Timer 6
@ void

countdownStart:
  mov   r1,lr
  push  {r0-r7}

  ldr		r0, = TIM6_CNT 
  ldr		r2, = 0x7a
  str		r2, [r0]

  ldr		r0, = TIM6_CR1
  ldr		r2, = 1
  str		r2, [r0]

  ldr   r0, = 5
  bl    setPinUpPortA

  pop   {r0-r7}
  mov   lr,r1
bx lr

@ Turns off Timer 6 and displays idle state
@ void

countdownEnd:
  mov   r1,lr
  push  {r0-r5}

  ldr		r0, = TIM6_CR1
  ldr		r2, = 0
  str		r2, [r0]

  mov   r7, r6
  ldr   r0, = textReady
  bl    display

  ldr   r0, = 5
  bl    setPinDownPortA

  pop   {r0-r5}
  mov   lr,r1
bx lr

@ Turns off Timer 6 and displays idle state
@ void

increment:

@ Increment any decadical value in r0 stored as d1 = b7,..,b4; d0 = b3,..,b0
@ r0 = time value

  mov   r1,lr
  push  {r1-r7}
  mov   r7,r0
  
  ldr   r2, = 0xF
  and   r2,r7,r2

  ldr   r1, = 9

  bl    byteCompare
  ldr   r1, = 1
  cmp   r0,r1
  bne   incrementd0   

  ldr   r0, = 0xF
  bic   r7, r0
  add   r7, #0x10
  b     incrementEnd

  incrementd0:
  add   r7, #1

  incrementEnd:
  mov   r0,r7
  pop   {r1-r7}
  mov   lr,r1
bx lr

decrement:

@ Decrement any decadical value in r0 stored as d1 = b7,..,b4; d0 = b3,..,b0
@ r0 = time value

  mov   r1,lr
  push  {r1-r7}
  mov   r7,r0

  ldr   r2, = 0xF
  and   r2,r7,r2

  ldr   r1, = 0

  bl    byteCompare
  ldr   r1, = 1
  cmp   r0,r1
  bne   decrementd0   

  ldr   r0, = 0x9
  orr   r7, r0
  sub   r7, #0x10
  b     decrementEnd

  decrementd0:
  sub   r7, #1

  decrementEnd:
  mov   r0,r7
  pop   {r1-r7}
  mov   lr,r1
bx lr

@ incrementing settime
@ r6 = settime

incrementTime:
  mov   r1,lr
  push  {r0-r5,r7}

  mov   r0, r6
  bl    increment
  mov   r6, r0
  ldr   r0, = textReady
  bl    display

  pop   {r0-r5,r7}
  mov   lr,r1
bx lr

@ decrementing settime
@ r6 = settime

decrementTime:
  mov   r1,lr
  push  {r0-r5}

  ldr   r1, = 0
  cmp   r1, r6
  beq   decrementTimeEnd

  mov   r0, r6
  bl    decrement
  mov   r6, r0
  ldr   r0, = textReady
  bl    display

  decrementTimeEnd:
  pop   {r0-r5}
  mov   lr,r1
bx lr

confirmTime:
  mov   r1,lr
  push  {r0-r5}
  mov   r7, r6
  ldr   r0, = textReady
  bl    display
  pop   {r0-r5}
  mov   lr,r1
bx lr
