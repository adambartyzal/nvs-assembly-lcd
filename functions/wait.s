@ Wait functions:

@ Fixed Wait Slow Stupid Function
@ void

wait: 

  ldr   r0, =0
  ldr   r1, = 100000  @ time 100000 a second ?
  loop1:
  add   r0, r0, #1
  cmp   r0, r1
  bne   loop1
  
bx lr

@ Fixed Wait Fast Stupid Function
@ void

wait2: 

  ldr   r0, =0
  ldr   r1, = 2000  @ time 100000 a second ?
  loop2:
  add   r0, r0, #1
  cmp   r0, r1
  bne   loop2
  
bx lr
