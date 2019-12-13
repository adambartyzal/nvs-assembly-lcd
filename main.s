.thumb

.include "init/adresses.s"
.include "init/symbols.s"
.global _start                          @ Make start function global so the linker can see it later
.include "init/vectortable.s"

.thumb_func				                @ Because of Thumb mode
_start:                                 @ Start Request Handler

.include "init/hardware.s"

ldr r7, = 0
ldr r6, = 1

@ Main Loop

loop:

bl    getchar
@ldr   r0, = 'A'
bl    putchar

b loop


@ Strings

.include "data/strings.s"

@ Functions

.include "functions/putchar.s"
.include "functions/getchar.s"
.include "functions/bytecompare.s"
.include "functions/setpins.s"
.include "functions/wait.s"
.include "functions/printf.s"

@ Interrupt Request Handlers

.include "irqhandlers/default.s"
.include "irqhandlers/nmi.s"
.include "irqhandlers/hardfault.s"
.include "irqhandlers/systick.s"
.include "irqhandlers/usart2.s"
