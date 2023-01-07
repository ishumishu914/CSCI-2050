extern printf
extern scanf
extern exit
global main
section .text

main:
    ;printf("Enter a string: ");
    mov rdi, promptmessage
    mov rax, 0
    push rcx
    call printf
    pop rcx

    ;scanf("%s", &string);
    mov rdi, inputmessage
    mov rsi, string
    mov rax, 0
    push rbx
    call scanf
    pop rbx

    mov r8, string ;1st char
    mov r9, string ;last char

    ;for(int i=0; i<length; i++)
    ;{
        ;if (string[i] != string[length-i-1])
        ;{
            ;printf("not palindrome");
            ;break;
        ;}
        ;printf("is palindrome");
    ;}

checkNull:
    mov al, [r9] ;al = 1st char of string
    cmp al, 0
    je startCheck

    inc r9 ;increment till string reaches null
    jmp checkNull

startCheck:
    dec r9 ;r9 points to [length-i-1] char of string
    
checkPalindrome:
    mov al, [r9] ; al= [length-i-1] char of string
    mov bl, [r8] ; bl = i-th char of string

    cmp al, bl ; check if the ith char and length-i-1 char are same
    jne printFalse ;if same mov to line 56
    cmp r8, r9 ; check if r8 & r9 point to middle letter
    je printTrue
     
    cmp al, bl ; if both chars are same check if they are the middle char
    je checkMiddle

    inc r8
    dec r9
    jmp checkPalindrome

checkMiddle: ; needed for even digit palindromes
    cmp r8, r9
    jne printTrue

printTrue:
    ;print("The palindrome is palindrome.");
    mov rdi, resultTrue
    mov rax, 0
    push rcx
    call printf
    pop rcx
    
    jmp return

printFalse:
    ;print("The palindrome is not palindrome.");
    mov rdi, resultFalse
    mov rax, 0
    push rbx
    call printf
    pop rbx

return:
    ret

section .data
    promptmessage db "Enter a string: ", 0
    inputmessage db "%s", 0
    string times 100 db 0

    resultTrue db "The string is palindrome.", 0ah,0dh, 0
    resultFalse db "The string is not palindrome.", 0ah,0dh, 0