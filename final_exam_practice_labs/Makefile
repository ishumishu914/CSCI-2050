all: sample1.asm sample2.asm sample3-1.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o sample1.o sample1.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o sample2.o sample2.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o sample3-1.o sample3-1.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o sample3-2.o sample3-2.asm	
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o sample4-1.o sample4-1.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o sample4-2.o sample4-2.asm
	gcc -m64 -no-pie -o sample1.out sample1.o
	gcc -m64 -no-pie -o sample2.out sample2.o
	gcc -m64 -no-pie -o sample3-1.out sample3-1.o	
	gcc -m64 -no-pie -o sample3-2.out sample3-2.o	
	gcc -m64 -no-pie -o sample4-1.out sample4-1.o	
	gcc -m64 -no-pie -o sample4-2.out sample4-2.o

clean:
	rm *.out
	rm *.o
