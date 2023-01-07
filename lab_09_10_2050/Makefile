all: encrypt.asm decrypt.asm minimum.asm 
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o encrypt.o encrypt.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o decrypt.o decrypt.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o minimum.o minimum.asm
	gcc -m64 -no-pie -o encrypt.out encrypt.o
	gcc -m64 -no-pie -o decrypt.out decrypt.o
	gcc -m64 -no-pie -o minimum.out minimum.o
clean:
	rm *.out
	rm *.o