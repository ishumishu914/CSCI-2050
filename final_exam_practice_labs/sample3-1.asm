extern printf
extern scanf
extern exit
global main
section .text
sumOfDivisibleBy3:
    mov r9, 0 ; for sum 
    mov rbx, 3

checkDivisible:
    cmp rsi, 0
    je endOfArray 

    mov rdx, 0
    mov rax, [rdi]
    idiv rbx

    cmp rdx, 0
    je Sum

nextNum:
    add rdi, 8
    dec rsi
    jmp checkDivisible

Sum:
    add r9, [rdi]
    jmp nextNum
    
endOfArray:
    mov [sum], r9
    ret 
    
main:
    mov rdi, array
    mov rsi, [array_size]
    call sumOfDivisibleBy3

    ; printf("The sum is ");
    mov rdi, resultSum
    mov rsi, [sum]
    mov rax, 0
    push rbx
    call printf
    pop rbx

    ;int array[] = {1,2,3,6,8,9,12};
    ;int size = 7, sum =0;

    ;for(int i=0; i<size; i++)
    ;{
        ;if(array[i]%3 == 0)
        ;{
            ;sum += array[i];
        ;}
    ;}
    ;printf("The sum is %d", sum)

    mov rax, 0
    call exit

section .data
    array_size dq 12
    array dq 1, 2, 6, -15, 9, 3, 7, 15, 1, 20, 5, 2
    sum dq 0

    resultSum db "The sum is %d", 0ah, 0dh, 0