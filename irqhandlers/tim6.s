@ Timer 6 Interrupt Request Handler
.thumb_func
_tim6_handler:
  push  {lr}

  ldr   r1, = 0
  ldr   r0, = TIM6_SR
  str   r1, [r0]  @ clear interrupt flag
  
  bl    decrement

  ldr   r0, = textRun
  bl    display


  ldr   r0, = 0
  cmp   r7, r0
  bne   skipEnd
  bl    countdownEnd
  b     tim6End
  skipEnd:

  tim6End:
  pop   {pc}
bx lr
