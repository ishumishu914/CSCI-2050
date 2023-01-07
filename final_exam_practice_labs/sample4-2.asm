extern printf
extern scanf
extern exit
global main
section .text

main:
    ; printf("Enter a string: ");
    mov rdi, promptAFormat
    mov rax, 0
    push rax 
    call printf 
    pop rax 

    ; scanf("%s", a);
    mov rdi, inputFormat
    mov rsi, a
    mov rax, 0
    push rax 
    call scanf 
    pop rax

    ; printf("Enter another string: ");
    mov rdi, promptBFormat
    mov rax, 0
    push rax 
    call printf 
    pop rax 

    ; scanf("%s", b);
    mov rdi, inputFormat
    mov rsi, b
    mov rax, 0
    push rax 
    call scanf 
    pop rax

    mov r8, a ; set r8 to the start of a
    mov r9, b ; set r9 to the end of b

    mov r10, b ; point to 1st char of b

BnullCheck:
    mov al, [r9]
    cmp al, 0
    je atEndOfB
    
    inc r9 
    jmp BnullCheck

atEndOfB:
    dec r9  ; last char of string b

nextChar:
    mov al, [r8]
    mov bl, [r9]

    cmp al, 0
    jne continue

    cmp r9, r10 ; is b[i] < b[0]
    jl true
    jmp false

continue:
    cmp al, bl
    jne false

    inc r8 ;a[i]++
    dec r9 ;b[i]--

    jmp nextChar

true:
    mov rdi, resultTrue
    mov rax, 0
    push rax
    call printf
    pop rax

    jmp endString
false:
    mov rdi, resultFalse
    mov rax, 0
    push rax 
    call printf
    pop rax

endString:
    mov rax, 0
    ret

section .data
    inputFormat db "%s", 0
    
    promptAFormat db "Enter a string: ", 0
    promptBFormat db "Enter another string: ", 0

    a times 51 db 0
    b times 51 db 0

    resultTrue db "The strings are the reverse of each other", 0ah, 0dh, 0
    resultFalse db "The strings are not the reverse of each other", 0ah, 0dh, 0