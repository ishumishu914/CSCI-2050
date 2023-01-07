extern printf
extern scanf
extern exit
global main
section .text
loopStart:
  ;shift = messages[i] - key[i]+65
  ;wrap = shift + 26 (if over the bound)
  mov rsi, rdi
  mov r8, rbx

shiftChar:
  mov bl, [r8]
  mov al, [rsi]
  cmp al, 0 ; check for null terminator
  je endOfFunction ; return result once end of string is reached
    
  add al, bl
  sub al, 65  
  
  cmp al, 91
  jge wrapBound

moveNextChar:
  mov [rsi], al 

  inc rsi
  inc r8

  jmp shiftChar

wrapBound:
  sub al, 26
  jmp moveNextChar

endOfFunction:
  ret

main:
  ; this is the following C program:
  ;char messages [50];
  ;char key [50]; 
  ;char result
  ;int shift, i=0, length = sizeof(messages)/sizeof(char);

  ;printf("Enter the messages: ");
  ;scanf("%d", &messages);

  ;printf("Enter the key: ");
  ;scanf("%s", &key);

  ;while(i<length)
    ;shift = messages[i] - key[i] + 65;
    ;bound = shift + 26; (bound = shift - 'Z' + 'A' - 1) (if over the bound)

  ;printf("Encrypted messages: %s", result);


  ;printf("Enter the messages: ");
  mov rdi, promptmessagesFormat
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ;scanf("%s", text);
  mov rdi, inputmessagesFormat
  mov rsi, text
  mov rax, 0
  push rcx
  call scanf
  pop rcx

  ;printf("Enter the key: ");
  mov rdi, promptKeyFormat
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ;scanf("%S", key);
  mov rdi, inputKeyFormat
  mov rsi, shiftVal
  mov rax, 0
  push rcx
  call scanf
  pop rcx
  
  mov rdi, text
  mov rbx, shiftVal
  push rax
  call loopStart
  pop rax

printResult:
  ;printf("Encrypted messages: %s", result);
  mov rdi, resultEncrypt
  mov rsi, text
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ; exit(0)
  mov rax, 0
  call exit

section .data

  promptmessagesFormat db "Enter messages: ", 0
  inputmessagesFormat db "%s", 0
  text times 51 db 0 
  
  promptKeyFormat db "Enter key: ", 0
  inputKeyFormat db "%s", 0
  shiftVal times 51 db 0 

  resultEncrypt db "Encrypted messages: %s", 0ah, 0dh, 0