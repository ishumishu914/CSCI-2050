all: exam_tosubmit.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o exam_tosubmit.o exam_tosubmit.asm
	gcc -m64 -no-pie -o main.out exam_tosubmit.o

clean:
	rm *.out
	rm *.o
