ARMGNU = /home/adam/software/gcc8/bin/arm-none-eabi

all: main.bin

main.o: main.s
	$(ARMGNU)-as -mthumb -mcpu=cortex-m0 -g3 -o main.o main.s

main.elf: main.o
	$(ARMGNU)-ld -Ttext 0x8000000 main.o -o main.elf
   
main.bin: main.elf   
	$(ARMGNU)-objcopy -S -O binary main.elf main.bin
	$(ARMGNU)-size main.elf
   
clean:
	rm main.elf main.o main.bin
