@ Enable clock for GPIOx peripheral in RCC registers
ldr   r2, = (1 << 19) | (1 << 17) | (1 << 0)  @ GPIOA and GPIOC
ldr   r0, = RCC_APB2ENR
ldr	  r1, [r0]
bic		r1, r2 
orr		r1, r2
str   r1, [r0]

ldr		r2, = 1 << 17 @ USART 2
ldr   r0, = RCC_APB1ENR
ldr	  r1, [r0]
bic		r1, r2
orr		r1, r2
str   r1, [r0]

@ Setting up SysTick

ldr		r2, = 1 << 1 | 1 << 0 @ GPIOA and GPIOC
ldr   r0, = (STK_CSR)
ldr   r1, [r0]
bic   r1, r2
orr   r1, r2
str   r1, [r0]

ldr   r0, = STK_CALIB
ldr   r1, [r0]
ldr   r0, = STK_RVR
str   r1, [r0]

ldr   r0, = STK_CVR
ldr   r1, [r0]
ldr   r2, = 0xFFFFFF
bic   r1, r2
ldr   r2, =1
orr   r1, r2
str   r1, [r0]


@ Setting up I/Os (not to use PA9 and PA10 .. SWDIO .. will break debug)

@ GPIOA
ldr		r2, = 3 << (2*4) | 3 << (2*3) | 3 << (2*2) | 3 << (2*1) | 3 << (2*0)	
ldr		r0, = GPIOA_MODER   @ 0 = IN, 1 = OUT, 2 = Alternative, 3 =  Analog
ldr		r1, [r0]
bic		r1, r1, r2
ldr		r2, = 1 << (2*4) | 2 << (2*3) | 2 << (2*2) | 1 << (2*1) | 1 << (2*0)
orr		r1, r1, r2
str		r1, [r0]

ldr		r2, = 1 << 4 | 1 << 3 | 1 << 2 | 1 << 1 | 1 << 0		
ldr		r0, = GPIOA_OTYPER  @  0 = Push pull, 1 = Open Drain
ldr		r1, [r0]
bic		r1, r1, r2
str		r1, [r0]

ldr		r2, = 3 << (2*4) | 3 << (2*3) | 3 << (2*2) | 3 << (2*1) | 3 << (2*0)		
ldr		r0, = GPIOA_OSPEEDR @ x0 = low speed, 01 = medium speed, 10 = high speed
ldr		r1, [r0]
bic		r1, r1, r2
ldr		r2, = 1 << (2*4) | 2 << (2*3) | 2 << (2*2) | 1 << (2*1) | 1 << (2*0)   
orr		r1, r1, r2
str		r1, [r0]

ldr		r2, = 1 << 4 | 1 << 3 | 1 << 2 | 1 << 1 | 1 << 0	
ldr		r0, = GPIOA_PUPDR   @ 00 = No, 01 = Pull up, 10 = Pull down, 11 = reserved   
ldr		r1, [r0]
bic		r1, r1, r2
str		r1, [r0]

ldr		r2, = 15 << (4*2) | 15 << (4*3) @ A2 - TX, A3 - RX
ldr		r0, = GPIOA_AFRL@ AFRL AF1 = USART, AF0 = TIM15
ldr		r1, [r0]
bic		r1, r1, r2
ldr		r2,  = 1 << (2*4) | 1 << (3*4)	
orr		r1, r1, r2
str		r1, [r0]


@ GPIOC
ldr		r2, = 3 << (2*7) | 3 << (2*6) | 3 << (2*5) | 3 << (2*4) | 3 << (2*3) | 3 << (2*2) | 3 << (2*1) | 3 << (2*0)
ldr		r0, = GPIOC_MODER   @ 0 = IN, 1 = OUT, 2 = Alternative, 3 =  Analog
ldr		r1, [r0]
bic		r1, r1, r2
ldr		r2, =  1 << (2*7) | 1 << (2*6) | 1 << (2*5) | 1 << (2*4) | 1 << (2*3) | 1 << (2*2) | 1 << (2*1) | 1 << (2*0)
orr		r1, r1, r2
str		r1, [r0]

ldr		r2, = 1 << 7 | 1 << 6 | 1 << 5 | 1 << 4 | 1 << 3 | 1 << 2 | 1 << 1 | 1 << 0
ldr		r0, = GPIOC_OTYPER  @ 0 = Push pull, 1 = Open Drain
ldr		r1, [r0]
bic		r1, r1, r2
str		r1, [r0]

ldr		r2, = 1 << 7 | 1 << 6 | 1 << 5 | 1 << 4 | 1 << 3 | 1 << 2 | 1 << 1 | 1 << 0	
ldr		r0, = GPIOC_OSPEEDR @ x0 = low speed, 01 = medium speed, 10 = high speed
ldr		r1, [r0]
bic		r1, r1, r2
ldr		r2, = 1 << 7 | 1 << 6 | 1 << 5 | 1 << 4 | 1 << 3 | 1 << 2 | 1 << 1 | 1 << 0	
orr		r1, r1, r2
str		r1, [r0]

ldr		r2, = 3 << (2*7) | 3 << (2*6) | 3 << (2*5) | 3 << (2*4) | 3 << (2*3) | 3 << (2*2) | 3 << (2*1) | 3 << (2*0)
ldr		r0, = GPIOC_PUPDR   @ 00 = No, 01 = Pull up, 10 = Pull down, 11 = reserved  
ldr		r1, [r0]
bic		r1, r1, r2
str		r1, [r0]

@ USART 2

ldr		r2, = 0xFFFF
ldr		r0, = USART2_BRR
ldr		r1, [r0]
bic		r1, r1, r2
ldr		r2, = 0x034D@ if oversampling by 16 (0 << 15 OVER8 in CR1) USARTDIV = 8 000 000/9600 BRR = USARTDIV = 833d = 0341h
orr		r1, r1, r2
str		r1, [r0]

ldr		r2, = 1 << 5 | 1 << 3 | 1 << 2 | 1 << 0 @ Enable Rx interrupt, TX, RX and USART
ldr		r0, = USART2_CR1
ldr		r1, [r0]
bic		r1, r1, r2
ldr		r2, = 1 << 3 | 1 << 2 | 1 << 0
orr		r1, r1, r2
str		r1, [r0]
