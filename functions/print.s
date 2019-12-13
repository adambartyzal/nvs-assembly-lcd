@ Print Function, call with r0 = string label
print:

  push {r1-r7}
  mov  r7, r0


  again:
  ldr  r1, = 6            @ TXE - transmit register empty
  ldr  r2, = USART2_ISR   @(USART2_ISR)
  ldr  r3, [r2]           @ content of r2 to r3
  lsr  r3, r1             @ rotation by num of bits in
  ldr  r2, = 1            @ 1 only in bit appropriate to r1 
  and  r3, r3,r2          @ mask 
  cmp  r3, r2             @ compare
  bne  again              @ r4 = 0

  ldrb r1,[r7]            
  add  r7, #1
  ldrb r2, =0x00
  
  mov  r3, lr
  push {r3}
  bl   byteCompare

  pop  {r3}
  mov  lr, r3
  cmp  r0, #1
  beq  printEnd

  ldr  r2, = USART2_TDR   @ TDR
  str  r1, [r2]           @ store r4 value to address pointed by r2
  b    again

  printEnd:

  pop {r1-r7}

bx lr
