@ Function for redrawing TUI and LCD
@ r0 = state text string, r7 = time

display:
  mov   r3,lr
  push  {r0-r6}



  pop   {r0-r6}
  mov   lr,r3
bx lr