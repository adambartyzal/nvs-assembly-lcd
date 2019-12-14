displayPutchar:
  mov   r1,lr
  push  {r0-r7}
  ldr   r1, = GPIOC_ODR
  str   r0, [r1] 
  bl    tick
  pop   {r0-r7}
  mov   lr,r1
bx lr

displayWrite:
  mov   r0,lr
  push  {r0-r7}
  ldr   r0, = 4
  bl    setPinUpPortA
  pop   {r0-r7}
  mov   lr,r0
bx lr

displaySet:
  mov   r0,lr
  push  {r0-r7}
  ldr   r0, = 4
  bl    setPinDownPortA
  pop   {r0-r7}
  mov   lr,r0
bx lr

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

displayInit:
  mov   r0,lr
  push  {r0-r7}

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

tick:
  mov   r0,lr
  push  {r0-r7}

  ldr   r0, = 1
  bl    setPinUpPortA
  bl    wait
  ldr   r0, = 1
  bl    setPinDownPortA
  bl    wait

  pop   {r0-r7}
  mov   lr,r0
bx lr

displayClear:
  mov   r0,lr
  push  {r0-r7}

  bl    displaySet
  bl    displayWrite

  pop   {r0-r7}
  mov   lr,r0
bx lr