@ Putchar Function, call with r0 = char
putchar:

  push {r1-r7}
  mov  r7, r0
  tryagain:
  ldr  r1, = 6            @ TXE - transmit register empty
  ldr  r2, = USART2_ISR   @(USART2_ISR)
  ldr  r3, [r2]           @ content of r2 to r3
  lsr  r3, r1             @ rotation by num of bits in
  ldr  r2, = 1            @ 1 only in bit appropriate to r1 
  and  r3, r3,r2          @ mask 
  cmp  r3, r2             @ compare
  bne  tryagain           @ r4 = 0
  ldr  r2, = USART2_TDR   @ TDR
  str  r7, [r2]           @ store r4 value to address pointed by r2
  pop {r1-r7}

bx lr
