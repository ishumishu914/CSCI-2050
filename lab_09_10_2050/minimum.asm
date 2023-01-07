extern printf
extern exit
global main
section .text

find_minimum:
  ;this is the c program
  ;int a[] = {1, -2, 8, 15, -9, 3, -7, 16, -1, 20, 5, 2}
  ;int min = a[0]
  ;int size = 12
  ;for (int i=1; i<size; ++i) 
  ;{
    ;if (a[i]<min) 
    ;{ 
      ;min = a[i]; 
    ;}
  ;}
  ;cout << "Minimum is " << min << endl;  

  mov rax, [rdi] ; min = array[0]

loopStart:
  mov rbx, [rdi] ;rbx = array[i]
  cmp rbx, rax ; is araay[i] < array[0]?
  jl update

nextNum:
  cmp rsi, 0 ; if size=0
  je endOfArray
  
  add rdi, 8 ; move to next element in array
  dec rsi ; decrement size (used as count)
  jmp loopStart
  
update:
  mov rax, rbx ; min = a[i]
  jmp nextNum

endOfArray:
  ret

main:
  mov rax, 0 ; clear off rax
  mov rdi, array
  mov rsi, [array_size]
  push r8
  call find_minimum
  pop r8

  ; printf("The minimum element is ");
  mov rdi, resultMinNum
  mov rsi, rax
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ; exit(0)
  mov rax, 0
  call exit

section .data
  array_size dq 12
  array dq 1, -2, 8, 15, -9, 3, -7, 16, -1, 20, 5, 2

  resultMinNum db "The minimum element is %d", 0ah, 0dh, 0