extern printf
extern scanf
extern exit
global main
section .text

main:
    ; printf("%s", "Enter a number: ");
    mov rdi, promptFormat
    mov rax, 0
    push rbx
    call printf
    pop rbx

    ; scanf("%d", &number);
    mov rdi, inputFormat
    mov rsi, n
    mov rax, 0
    push rcx
    call scanf
    pop rcx

    mov rdi, fibArray

    mov r8, 0 ;older fib
    mov r9, 1 ;newer fib

    mov r10, 1 ;count
    
    ; add these two to our array
    mov [rdi], r8 
    add rdi, 8
    mov [rdi], r9 
    add rdi, 8

getFibonaccis:
    cmp r10, [n] ;if count = n print result
    je printResult

    ; calculate the next fibonacci number
    mov r11, r9 ; r11= 1
    add r9, r8 ; r9 = 0
    mov r8, r11 ; r8 = 1

    inc r10 ; count++

    mov [rdi], r9
    add rdi, 8
    jmp getFibonaccis

printResult:
    ; print the fibonacci numbers
    ;mov r12, [n]
    mov r13, 1 ; array index count
    mov r14, fibArray

nextNum:
    mov rdi, outputArrayFormat
    mov rsi, [r14]
    mov rax, 0
    push rax 
    call printf 
    pop rax

    add r14, 8 ; move to next array element index
    inc r13 ; increment index counter
    cmp r13, [n]
    jle nextNum

    mov rax, 0
    call exit
section .data
    inputFormat db "%d", 0
    promptFormat db "Enter a number: ", 0
    outputArrayFormat db "%d ", 0

    n dq 0  
    fibArray times 100 dq 0
