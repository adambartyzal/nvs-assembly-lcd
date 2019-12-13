@ Byte Compare func use r1 = byte 1, r2 = byte 2, r0 = 1 if same
byteCompare:
push {r3-r7}            @ save everything unneccessary

mov r6, r1              @ to preserve byte 1
mov r7, r2              @ to preserve byte 2

ldr r3, = 0             @ for incrementing pointer
ldr r0, = 0             @ false outcome

byteCompareEndStart:
ldr r4, = 1             @ masking bit at LSB for byte1
ldr r5, = 1             @ masking bit at LSB for byte2
lsr r6, #1              @ rotate byte1 right of pointer size
lsr r7, #1              @ rotate byte2 right of pointer size
and r4, r4, r6          @ mask and save to r4
and r5, r5, r7          @ mask and save to r5
cmp r4, r5              @ compare two LSBs
bne byteCompareEndFalse @ if no the same end with false
add r3, #1              @ increment pointer
ldr r0, = 8             @ to check if all bytes were compared
cmp r0,r3               @ r0 now used for compare
beq byteCompareEndTrue  @ if true end
ldr r0, = 0             @ r0 false outcome again
b byteCompareEndStart   @ back to begining
byteCompareEndTrue:
ldr r0, = 1             @ set outcome to true
byteCompareEndFalse:
pop {r3-r7}             @ return registers
bx lr                   @ return 
