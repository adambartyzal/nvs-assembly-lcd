@ Function getchar r0 = char form usart2
getchar:

  push {r1-r7}

  readAgain:
  ldr  r1, = 5          @ RXNE - Recieve register not empty
  ldr  r0, = USART2_ISR @(USART2_ISR)
  ldr  r3, [r0]         @ content of r0 to r3
  lsr  r3, r1           @ rotation by num of bits in
  ldr  r0, = 1          @ 1 only in bit appropriate to r1 
  and  r3, r3, r0       @ mask 
  cmp  r3, r0           @ compare
  bne  readAgain
  ldr  r2, = USART2_RDR 
  ldrb r0, [r2]

  pop {r1-r7}
bx lr
