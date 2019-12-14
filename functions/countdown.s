@ Time functions

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

countdownEnd:
  mov   r1,lr
  push  {r0-r7}

  ldr		r0, = TIM6_CR1
  ldr		r2, = 0
  str		r2, [r0]

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

  pop   {r0-r7}
  mov   lr,r1
bx lr