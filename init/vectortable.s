@ Vector Table:

.word               0x20001000		                  @ Vector 0x0000 - Stack pointer init value (0x20000000 is RAM address and 0x1000 is 4kB size, stack grows "downwards")
.word               _start			                    @ Vector 0x0004 - Reset vector - where the code begins
.word               _default_handler                @ Vector 0x0008 - NMI
.word               _hardfault_handler              @ Vector 0x000C - HardFault
.word               0                               @ Vector 0x0010 - Reserved
.word               0                               @ Vector 0x0014 - Reserved
.word               0                               @ Vector 0x0018 - Reserved
.word               0                               @ Vector 0x001C - Reserved
.word               0                               @ Vector 0x0020 - Reserved
.word               0                               @ Vector 0x0024 - Reserved
.word               0                               @ Vector 0x0028 - Reserved
.word               _default_handler                @ Vector 0x002C - SVCall
.word               0                               @ Vector 0x0030 - Reserved
.word               0                               @ Vector 0x0034 - Reserved
.word               _default_handler                @ Vector 0x0038 - PendSV 
.word               _systick_handler                @ Vector 0x003C - SysTick
.word               _default_handler                @ Vector 0x0040 - WWDG
.word               0                               @ Vector 0x0044 - Reserved
.word               _default_handler                @ Vector 0x0048 - RTC
.word               _default_handler                @ Vector 0x004C - FLASH  
.word               _default_handler                @ Vector 0x0050 - RCC
.word               _default_handler                @ Vector 0x0054 - EXTI Line 0 and 1
.word               _default_handler                @ Vector 0x0058 - EXTI Line 2 and 3
.word               _default_handler                @ Vector 0x005C - EXTI Line 4 to 15
.word               0                               @ Vector 0x0060 - Reserved
.word               _default_handler                @ Vector 0x0064 - DMA1 Channel 1       
.word               _default_handler                @ Vector 0x0068 - DMA1 Channel 2 and Channel 3
.word               _default_handler                @ Vector 0x006C - DMA1 Channel 4 and Channel 5
.word               _default_handler                @ Vector 0x0070 - ADC1    
.word               _default_handler                @ Vector 0x0074 - TIM1 Break, Update, Trigger and Commutation
.word               _default_handler                @ Vector 0x0078 - TIM1 Capture Compare 
.word               0                               @ Vector 0x007C - Reserved
.word               _default_handler                @ Vector 0x0080 - TIM3    
.word               _tim6_handler                   @ Vector 0x0084 - TIM6    
.word               0                               @ Vector 0x0088 - Reserved
.word               _default_handler                @ Vector 0x008C - TIM14   
.word               _default_handler                @ Vector 0x0090 - TIM15   
.word               _default_handler                @ Vector 0x0094 - TIM16   
.word               _default_handler                @ Vector 0x0098 - TIM17   
.word               _default_handler                @ Vector 0x009C - I2C1    
.word               _default_handler                @ Vector 0x00A0 - I2C2    
.word               _default_handler                @ Vector 0x00A4 - SPI1    
.word               _default_handler                @ Vector 0x00A8 - SPI2    
.word               _default_handler                @ Vector 0x00AC - USART1  
.word               _usart2_handler                 @ Vector 0x00B0 - USART2  
.word               0                               @ Vector 0x00B4 - Reserved
.word               0                               @ Vector 0x00B8 - Reserved
.word               0                               @ Vector 0x00BC - Reserved
