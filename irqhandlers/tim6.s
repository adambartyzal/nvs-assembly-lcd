@ Default Handler
.thumb_func
_tim6_handler:
  push  {lr}

  ldr   r1, = 0
  ldr   r0, = TIM6_SR
  str   r1, [r0]  @ clear interrupt flag

  bl    displayBegining

  ldr   r0, = textRun
  bl    displayPrint
  bl    displaySecondline
  ldr   r0, = textTime
  bl    displayPrint

  sub   r7, #1
  ldr   r0, = -1
  cmp   r7, r0
  bne   skipOverflow
  sub   r6, #1
  ldr   r7, = 9
  skipOverflow:
  ldr   r0, = -1
  cmp   r6, r0
  bne   skipEnd
  bl    countdownEnd
  skipEnd:

  ldr   r0, = '0' @ disp tens of seconds
  add   r0, r6
  bl    displayPutchar
  ldr   r0, = '0' @ disp ones of seconds
  add   r0, r7
  bl    displayPutchar

  pop   {pc}
bx lr
