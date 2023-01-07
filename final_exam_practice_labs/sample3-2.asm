extern printf
extern scanf
extern exit
global main
section .text

countEs:
    mov rbx, 0

nextChar:
    mov al, [rdi]
    cmp al, 0
    je endofstring

    cmp al, 'e'
    je foundE
continue:
    inc rdi
    jmp nextChar

foundE:
    mov [rsi], al
    inc rsi
    inc rbx
    jmp continue

endofstring:
    mov [count], rbx
    ret
main:
    mov rdi, inputPrompt
    mov rax, 0
    push rax
    call printf
    pop rax

    mov rdi, inputFormat
    mov rsi, string
    mov rax, 0
    push rax
    call scanf
    pop rax

    mov rax, 0
    mov rdi, string
    mov rsi, estring
    call countEs

    mov rdi, outputFormat
    mov rsi, [count]
    mov rdx, string
    mov rcx, estring
    push rax
    call printf
    pop rax

    mov rax, 0
    call exit

section .data
    inputPrompt db "Enter a string: ", 0
    inputFormat db "%s", 0
    count dq 0

    string times 51 db 0
    estring times 51 db 0

    outputFormat db "There are %d e's in '%s': '%s'.", 0ah, 0dh, 0