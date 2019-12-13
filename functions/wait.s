@ Fixed Wait Stupid Function
wait: 
                @ dummy counter to slow down loop
    ldr     r0, =0
    ldr     r1, = 1000                             @ time 100000 a second ?
    loop1:
    add     r0, r0, #1
    cmp     r0, r1
    bne     loop1
bx      lr
