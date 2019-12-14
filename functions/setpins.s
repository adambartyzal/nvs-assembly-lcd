@ set of functions to set pins on gates
@ calls r0 = pinNum, setPin[Up/Down]Port[name]

setPinUpPortC:

  ldr   r1, = 1
  lsl   r1, r0
  ldr   r0, = GPIOC_BSRR
  str   r1, [r0]
   
bx lr

setPinDownPortC:

  ldr   r1, = 1
  lsl   r1, r0
  ldr   r0, = 16
  lsl   r1, r0
  ldr   r0, = GPIOC_BSRR
  str   r1, [r0]
   
bx lr

setPinUpPortA:

  ldr   r1, = 1
  lsl   r1, r0
  ldr   r0, = GPIOA_BSRR
  str   r1, [r0]
   
bx lr

setPinDownPortA:

  ldr   r1, = 1
  lsl   r1, r0
  ldr   r0, = 16
  lsl   r1, r0
  ldr   r0, = GPIOA_BSRR
  str   r1, [r0]
   
bx lr
