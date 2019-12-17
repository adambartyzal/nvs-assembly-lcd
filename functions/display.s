@ Function for redrawing TUI and LCD
@ r0 = state text string, r7 = time

display:
  mov   r3,lr
  push  {r0-r5}

  mov   r5, r0
  bl    printf
  bl    displayBegining
  mov   r0, r5
  bl    displayPrint
  ldr   r0, = textTime
  bl    displayPrint

  ldr   r0, = textTime
  bl    printf

  @ ones of seconds
  mov   r0, r7
  ldr   r1, = 0xF0
  and   r0, r1
  lsr   r0, #4
  add   r0, #0x30
  mov   r3, r0
  bl    displayPutchar
  mov   r0, r3
  bl    putchar

  @ tens of seconds
  mov   r0, r7
  ldr   r1, =0xF
  and   r0, r1
  add   r0, #0x30
  mov   r3, r0
  bl    displayPutchar
  mov   r0, r3
  bl    putchar

  ldr   r0, = '\r'
  bl    putchar
  ldr   r0, = '\n'
  bl    putchar

  bl    displaySecondline

  ldr   r0, = textSet
  bl    displayPrint

  @ ones of seconds
  mov   r0, r6
  ldr   r1, = 0xF0
  and   r0, r1
  lsr   r0, #4
  add   r0, #0x30
  bl    displayPutchar

  @ tens of seconds
  mov   r0, r6
  ldr   r1, =0xF
  and   r0, r1
  add   r0, #0x30
  bl    displayPutchar

  pop   {r0-r5}
  mov   lr,r3
bx lr

