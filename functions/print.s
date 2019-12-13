@ Print Function, call with r2 = string label
print:

    again:
    ldr     r1, = 6                                 @ TXE - transmit register empty
    ldr     r0, = USART2_ISR                        @(USART2_ISR)
    ldr     r3, [r0]                                @ content of r0 to r3
    lsr     r3, r1                                  @ rotation by num of bits in
    ldr     r0, = 1                                 @ 1 only in bit appropriate to r1 
    and     r3, r3,r0                               @ mask 
    cmp     r3, r0                                  @ compare
    bne     again                                   @ r4 = 0

    ldrb    r4,[r2]                                 
    add     r2, #1
    
    @ check zero byte
    push    {r0,r1,r2,r3,r5,r6}
    
    ldr     r3, = 0                                 @ bit shift
    ldr     r0, = 1                                 @ one for comparing
    ldr     r7, = 1

    checkZeroByteStart:
    ldr     r1, = 1
    lsl     r1, r3
    and     r1, r1, r4    
    lsr     r1, r3
    cmp     r0, r1
    beq     checkZeroByteFalseEnd
    add     r3, #1
    ldr     r1, = 7                                 @ to check only one byte
    cmp     r3, r1
    beq     checkZeroByteTrueEnd
    b       checkZeroByteStart

    checkZeroByteFalseEnd:
    ldr     r7, = 0
    checkZeroByteTrueEnd:
    pop     {r0,r1,r2,r3,r5,r6}
    
    cmp     r7, #1
    beq     printEnd

    ldr     r0, = USART2_TDR                        @ TDR
    str     r4, [r0]                                @ store r4 value to address pointed by r0
    b       again

    printEnd:

bx lr
