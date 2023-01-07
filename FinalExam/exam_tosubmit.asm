extern printf
extern scanf

global main

section .text

; YOUR FUNCTION GOES HERE
getDivisible:
	mov rsi, startValues
	mov rdi, endValues
	mov rdx, [numValues]
	mov rcx, divisor
	mov r9, 1

checkDivisible:
	cmp r9, rdx
	je endOfArray

	mov rbx, 0
	mov rax, [rsi]
	idiv rcx

	cmp rbx, 0
	jne skipNum

	cmp rbx, 0
	je printResult

	inc r9

skipNum:
	mov [rdi], rsi
	inc r9
	add rsi, 8
	jmp checkDivisible

printResult:
	mov r10, 1 ; endValues array count
	mov r11, [rsi]
	mov r12, [rdi]

nextNum:
	mov rdi, outputFmt
	mov rsi, r11
	mov rdx, [rcx]
	mov rax, 0
	push rax
	call printf
	pop rax

	add r11, 8 ; mov to next element index in endValues array
	add r12, 8
	inc r10 ; r10++
	cmp r10, rdx
	jle nextNum

	; printf("\n");
	;mov rdi, outputNewline
	;mov rax, 0
	;push rax 
	;call printf 
	;pop rax 

endOfArray
	ret

main:
	; YOUR TEST CODE GOES HERE
	mov rdi, inputPrmpt
	mov rax, 0
	push rax
	call printf
	pop rax

	mov rdi, inputFmt
	mov rsi, divisor
    mov rax, 0
    push rax 
    call scanf 
    pop rax

	mov rsi, startValues
    mov rdi,[numValues]
    mov rax, 0
    push rax
    call getDivisible
    pop rax

	; return 0
	mov rax, 0
	ret

section .data

	startValues  dq 70, -1, -16, 0, -7, 15, 11, -72, 30, -9, 23, 19, -28, 13, 6, 21, -2, 33, -5, 4
	endValues 	 times 20 dq 0
	numValues    dq 20

	inputPrmpt   db "Enter a number: ", 0
	inputFmt     db "%d", 0
	divisor      dq 0

    outputFmt    db "%d is divisible by %d", 0xa, 0
	outputNewline db 0xa, 0