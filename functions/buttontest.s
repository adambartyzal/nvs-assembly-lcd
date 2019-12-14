@ Button test function: Call with r1 = GPIOCx
buttonTest:                       @ button testing 
  ldr   r0, = (GPIOC_BASE + 0x10) @(GPIOC_IDR)
  ldr   r3, [r0]                  @ content of r0 to r3
  lsr   r3, r1                    @ rotation by num of bits in
  ldr   r2, = 1                   @ 1 only in bit appropriate to r1 
  and   r3, r3,r2                 @ mask 
  cmp   r3, r2                    @ compare
  beq   skipButtonCon             @ r4 = 0
  ldr   r0, = 1
  lsl   r0, r1
  bic   r5, r0
  orr   r5, r0
  b     buttonGetOut
  skipButtonCon:
  ldr   r0, = 1
  lsl   r0, r1
  mov   r2, r5
  and   r2, r0
  cmp   r2, r0
  beq   pressed                   @ go to pressed if not
  buttonGetOut:
bx lr
