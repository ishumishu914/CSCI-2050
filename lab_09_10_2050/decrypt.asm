extern printf
extern scanf
extern exit
global main
section .text

loopStart:
  ;shift = message[i] + key[i]-65
  ;wrap = shift - 26 (if over the bound)
  mov rsi, rdi
  mov r8, rbx

shiftChar:
  mov bl, [r8]
  mov al, [rsi]
  cmp al, 0 ; check for null terminator
  je endOfFunction ; return result once end of string is reached
    
  sub al, bl
  add al, 65  
  
  cmp al, 64
  jle wrapBound

moveNextChar:
  mov [rsi], al 

  inc rsi
  inc r8

  jmp shiftChar

wrapBound:
  add al, 26
  jmp moveNextChar

endOfFunction:
  ret

main:
  ; this is the following C program:
  ;char message [50];
  ;char key [50]; 
  ;char result
  ;int shift, i=0, length = sizeof(message)/sizeof(char);

  ;printf("Enter the message: ");
  ;scanf("%d", &message);

  ;printf("Enter the key: ");
  ;scanf("%s", &key);

  ;while(i<length)
    ;shift = message[i] + key[i] - 65;
    ;bound = shift - 26; (bound = shift - 'Z' + 'A' - 1) (if over the bound)

  ;printf("Encrypted message: %s", result);


  ;printf("Enter the message: ");
  mov rdi, promptMessageFormat
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ;scanf("%s", text);
  mov rdi, inputMessageFormat
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
  ;printf("Encrypted message: %s", result);
  mov rdi, resultDecrypt
  mov rsi, text
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ; exit(0)
  mov rax, 0
  call exit

section .data

  promptMessageFormat db "Enter message: ", 0
  inputMessageFormat db "%s", 0
  text times 51 db 0 
  
  promptKeyFormat db "Enter key: ", 0
  inputKeyFormat db "%s", 0
  shiftVal times 51 db 0 

  resultDecrypt db "Decrypted message: %s", 0ah, 0dh, 0