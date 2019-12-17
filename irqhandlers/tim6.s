@ Timer 6 Interrupt Request Handler
.thumb_func
_tim6_handler:
  push  {lr}

  ldr   r1, = 0
  ldr   r0, = TIM6_SR
  str   r1, [r0]  @ clear interrupt flag
  
  mov   r0, r7
  bl    decrement
  mov   r7, r0

  ldr   r0, = textRun
  bl    display


  ldr   r0, = 0
  cmp   r7, r0
  bne   jumpToEnd
  bl    countdownEnd
  b     tim6End
  jumpToEnd:

  tim6End:
  pop   {pc}
bx lr
