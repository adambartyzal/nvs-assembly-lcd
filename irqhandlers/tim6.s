@ Timer 6 Interrupt Request Handler
.thumb_func
_tim6_handler:
  push  {lr}

  ldr   r1, = 0
  ldr   r0, = TIM6_SR
  str   r1, [r0]  @ clear interrupt flag

  @ put here: display

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
  b     countdownEndEnd
  skipEnd:

  countdownEndEnd:
  pop   {pc}
bx lr
