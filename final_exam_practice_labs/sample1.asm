extern printf
extern scanf
extern exit
global main
section .text

main:
    ;printf("Enter a number: ");
    mov rdi, promptmessage
    mov rax, 0
    push rcx
    call printf
    pop rcx

    ;scanf("%d", &integer);
    mov rdi, inputmessage
    mov rsi, integer
    mov rax, 0
    push rbx
    call scanf
    pop rbx

    ;for (int i=2; i<n; i++)
    ;{
        ;if (n%i == 0)
        ;{
            ;printf("The number is not prime");
        ;}
        ;printf("The number is prime");
    ;{
    mov r8, 2
    mov r9, [integer]

checkPrime:
    cmp r9,1
    jle printNotPrime

    mov rdx, 0
    mov rax, r9
    div r8

    cmp rdx, 0
    je printNotPrime

    inc r8 
    cmp r8, r9
    jl checkPrime

printPrime:
    ;print("The number is prime.");
    mov rdi, resultIsPrime
    mov rax, 0
    push rcx
    call printf
    pop rcx
    
    jmp return

printNotPrime:
    ;print("The number is not prime.");
    mov rdi, resultIsNotPrime
    mov rax, 0
    push rbx
    call printf
    pop rbx

return:
    ret

section .data
    promptmessage db "Enter a number: ", 0
    inputmessage db "%d", 0
    integer dq 0

    resultIsPrime db "The number is prime.", 0ah,0dh, 0
    resultIsNotPrime db "The number is not prime.", 0ah,0dh, 0