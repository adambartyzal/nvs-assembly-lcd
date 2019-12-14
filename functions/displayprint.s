@ Display Print Function, call with r0 = string label
displayPrint:
  mov   r1,lr
  push  {r1-r7}

  next:

  ldrb  r1,[r0]
  mov   r3, r0
  mov   r4, r1
  ldrb  r2, =0x00
  bl    byteCompare
  ldr   r1, =1  @ to check if result was 1
  cmp   r0, r1
  beq   displyPrintEnd
  mov   r0, r4
  bl    displayPutchar
  mov   r0, r3
  add   r0, #1
  b     next

  displyPrintEnd:

  pop   {r1-r7}
  mov   lr,r1
bx lr
