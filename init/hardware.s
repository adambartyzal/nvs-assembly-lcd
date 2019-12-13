    @ Enable clock for GPIOx peripheral in RCC registers
    ldr		r2, = (1 << 19) | (1 << 17) | (1 << 0)  @ GPIOA and GPIOC
    ldr     r0, = (RCC_APB2ENR)                     @ RCC_APB2ENR
    ldr	    r1, [r0]		                        @ Nacteni hodnoty z adresy v r0 do r1
    bic		r1, r2 		                            @ mask except 1 in r2(bic means A&=!B)
    orr		r1, r2		                            @ from 0 to 1
    str     r1, [r0]                                @ store to adress r0 value in r1

    ldr		r2, = (1 << 17)                         @ USART 2
    ldr     r0, = (RCC_APB1ENR)                     @ RCC_APB1ENR
    ldr	    r1, [r0]		                        @ Nacteni hodnoty z adresy v r0 do r1
    bic		r1, r2 		                            @ mask except 1 in r2(bic means A&=!B)
    orr		r1, r2		                            @ from 0 to 1
    str     r1, [r0]                                @ store to adress r0 value in r1

    @ Setting up SysTick

    ldr		r2, = (1 << 0) | (1 << 1)               @ GPIOA and GPIOC
    ldr     r0, = (STK_CSR)                         @ STK_CSR
    ldr     r1, [r0]
    bic     r1, r2
    orr     r1, r2		                            @ from 0 to 1
    str     r1, [r0]                                @ store to adress r0 value in r1  

    ldr     r0, = STK_CALIB                          @ load calibration value
    ldr     r1, [r0]                                @ to r1
    ldr     r0, = STK_RVR                            @ and save it
    str     r1, [r0]                                @ to SysTick reload value register 

    ldr     r0, = STK_CVR                            @ load current value
    ldr     r1, [r0]                                @ to r1
    ldr     r2, = 0xFFFFFF
    bic     r1, r2    
    ldr     r2, =1                                  @ to r1
    orr     r1, r2
    str     r1, [r0]                                @ to SysTick reload value register 


    @ Setting up I/Os (not to use PA9 and PA10 .. SWDIO .. will break debug)

    @ GPIOA
    ldr		r2, = 3 << (2 * 2) | 3 << (3 * 2) | 3 << (5 * 2) | 3 << (6 * 2)                  @ A6 A8		
    ldr		r0, = GPIOA_BASE                        @ MODER // 1 = OUT; 3 =  IN - (After restart)
    ldr		r1, [r0]		                        @ content of r0 to r1
    bic		r1, r1, r2 		                        @ mask except 1 in r2
    ldr		r2, = 2 << (2 * 2) | 2 << (3 * 2) | 1 << (5 * 2) | 1 << (6 * 2)             @ 01 = Out, 10 = AF
    orr		r1, r1, r2		                        @ from 0 to 1
    str		r1, [r0]		                        @ save to register at r0

    ldr		r2, = 1 << (2) | 1 << (3) | 1 << (5) | 1 << (6)		
    ldr		r0, = GPIOA_BASE + 0x04                 @ OTYPER
    ldr		r1, [r0]		                        @ content of r0 to r1
    bic		r1, r1, r2 		                        @ mask except 1 in r2
    ldr		r2, = 0 << (2) | 0 << (3) | 1 << (5) | 1 << (6)             @ 0 = Push/Pull 1 = Open Drain
    orr		r1, r1, r2	        	                @ from 0 to 1
    str		r1, [r0]	        	                @ save to register at r0

    ldr		r2, = 3 << (0 * 2) | 3 << (1 * 2) | 3 << (5 * 2) | 3 << (6 * 2) 	
    ldr		r0, = GPIOA_BASE + 0x08                 @ OSPEEDR
    ldr		r1, [r0]		                        @ content of r0 to r1
    bic		r1, r1, r2 		                        @ mask except 1 in r2
    ldr		r2, = 0 << (2 * 2) | 0 << (3 * 2) | (3 << (5 * 2)) | 3 << (6 * 2)                     @ put 1 do r2
    orr		r1, r1, r2	        	                @ from 0 to 1
    str		r1, [r0]	        	                @ save to register at r0

    ldr		r2, = 1 << (0) | 1 << (1) | 1 << (5) | 1 << (6)	                       @ A5		
    ldr		r0, = GPIOA_BASE + 0x0C                 @ PUPDR // //00 = No, 01 = Pull up, 10 = Pull down, 11 = reserved   
    ldr		r1, [r0]		                        @ content of r0 to r1
    bic		r1, r1, r2 		                        @ mask except 1 in r2
    ldr		r2,  = 0 << (2) | 0 << (3) | 1 << (5) | 1 << (6)         	            @ put 1 do r2
    orr		r1, r1, r2	        	                @ from 0 to 1
    str		r1, [r0]	        	                @ save to register at r0

    ldr		r2, = 15 << (2*4) | 15 << (3*4)                       @ A2 - TX, A3 - RX
    ldr		r0, = GPIOA_BASE + 0x20                 @ AFRL AF1 = USART, AF0 = TIM15
    ldr		r1, [r0]		                        @ content of r0 to r1
    bic		r1, r1, r2 		                        @ mask except 1 in r2
    ldr		r2,  = 1 << (2*4) | 1 << (3*4)    	            @ put 1 do r2
    orr		r1, r1, r2	        	                @ from 0 to 1
    str		r1, [r0]	        	                @ save to register at r0

    
    @ GPIOC
    ldr		r2, = 3 << (6 * 2) | 3 << (8 * 2)                   @ A6 A8		
    ldr		r0, = GPIOC_BASE                        @ MODER // 1 = OUT; 3 =  IN - After restart
    ldr		r1, [r0]		                        @ content of r0 to r1
    bic		r1, r1, r2 		                        @ mask except 1 in r2
    ldr		r2, =(1 << (6 * 2)) | 1 << (8 * 2)                      @ put 1 do r2 
    orr		r1, r1, r2		                        @ from 0 to 1
    str		r1, [r0]		                        @ save to register at r0

    ldr		r2, = 1 << (6) | 1 << (8)		
    ldr		r0, = GPIOC_BASE + 0x04                 @ OTYPER
    ldr		r1, [r0]		                        @ content of r0 to r1
    bic		r1, r1, r2 		                        @ mask except 1 in r2
    ldr		r2, =(1 << (6)) | 1 << (8)
    orr		r1, r1, r2	        	                @ from 0 to 1
    str		r1, [r0]	        	                @ save to register at r0

    ldr		r2, = 3 << (6 * 2) | 3 << (8 * 2)   	
    ldr		r0, = GPIOC_BASE + 0x08                 @ OSPEEDR
    ldr		r1, [r0]		                        @ content of r0 to r1
    bic		r1, r1, r2 		                        @ mask except 1 in r2
    ldr		r2, =(3 << (8 * 2)) | 3 << (6 * 2)                     @ put 1 do r2
    orr		r1, r1, r2	        	                @ from 0 to 1
    str		r1, [r0]	        	                @ save to register at r0

    ldr		r2, = 3 << (6 * 2) | 3 << (8 * 2)                       @ A5		
    ldr		r0, = GPIOC_BASE + 0x0C                 @ PUPDR
    ldr		r1, [r0]		                        @ content of r0 to r1
    bic		r1, r1, r2 		                        @ mask except 1 in r2
    ldr		r2, =(1 << (6 * 2)) | 1 << (8 * 2)         	            @ put 1 do r2
    orr		r1, r1, r2	        	                @ from 0 to 1
    str		r1, [r0]	        	                @ save to register at r0

    @ USART 2

    ldr		r2, = 0xFFFF
    ldr		r0, = USART2_BASE + 0x0C                @ BRR
    ldr		r1, [r0]		                        @ content of r0 to r1
    bic		r1, r1, r2 		                        @ mask except 1 in r2
    ldr		r2, = 0x034D                             @ if oversampling by 16 (0 << 15 OVER8 in CR1) USARTDIV = 8 000 000/9600 BRR = USARTDIV = 833d = 0341h
    orr		r1, r1, r2		                        @ from 0 to 1
    str		r1, [r0]		                        @ save to register at r0

    ldr		r2, = 1 << 5 | 1 << 3 | 1 << 2 | 1 << 0                 @ Enable Rx interrupt, TX, RX and USART
    ldr		r0, = USART2_BASE + 0x00                @ CR1 
    ldr		r1, [r0]		                        @ content of r0 to r1
    bic		r1, r1, r2 		                        @ mask except 1 in r2
    ldr		r2, = 1 << 3 | 1 << 2 | 1 << 0
    orr		r1, r1, r2		                        @ from 0 to 1
    str		r1, [r0]		                        @ save to register at r0
    