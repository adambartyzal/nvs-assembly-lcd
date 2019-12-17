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

  pop   {r0-r7}
  mov   lr,r1
bx lr

@ Turns off Timer 6 and displays idle state
@ void

countdownEnd:
  mov   r1,lr
  push  {r0-r7}

  ldr		r0, = TIM6_CR1
  ldr		r2, = 0
  str		r2, [r0]

  @ set time to user defiend value
  @ put here: display

  pop   {r0-r7}
  mov   lr,r1
bx lr


