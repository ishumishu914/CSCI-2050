extern printf
extern scanf
extern exit

global main

section .text

main:
  ; this is the following C program:
  ;char name [50]; 
  ;int ageDogYears;
  ;int age;
  ;int ageYear2100;  

  ;printf("Enter age: ");
  ;scanf("%d", &age);

  ;printf("Enter name: ");
  ;scanf("%s", name);

  ;ageDogYears = age * 7;
  ;ageYear2100 = age + 79;

  ;printf("%s is %d dog years old", name, ageDogYears);
  ;printf("%s will be %d years old in the year 2100", name,ageYear2100);

  ;printf("What is your name? ");
  mov rdi, promptNameFormat
  mov rsi, promptName
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ;scanf("%s", name);
  mov rdi, inputNameFormat
  mov rsi, name
  mov rax, 0
  push rcx
  call scanf
  pop rcx

  ;printf("How old are you? ");
  mov rdi, promptAgeFormat
  mov rsi, promptAge
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ;scanf("%d", &age);
  mov rdi, inputAgeFormat
  mov rsi, age
  mov rax, 0
  push rcx
  call scanf
  pop rcx

  ;dogyears = age * 7;
  mov rax, [age]
  mov rbx, 7
  imul rbx  
  mov [age_in_dog_years], rax 

  ;printf("%s is %d dog years old", name, ageDogYears);
  mov rdi, resultDogAge
  mov rsi, name
  mov rdx, [age_in_dog_years]
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ;ageYear2100 = age + 79;
  mov rax, [age]
  mov rbx, 79
  add rax, rbx
  mov [age_in_year_2100], rax

  ;printf("%s will be %d years old in the year 2100", name, ageYear2100);
  mov rdi, resultAge2100
  mov rsi, name 
  mov rdx, [age_in_year_2100]
  mov rax, 0 
  push rbx
  call printf
  pop rbx

  ; exit(0)
  mov rax, 0
  call exit

section .data

  promptNameFormat db "%s", 0
  promptName db "What is your name?  ", 0

  inputNameFormat db "%s", 0
  name dq 0 

  promptAgeFormat db "%s", 0
  promptAge db "How old are you? ", 0

  inputAgeFormat db "%d", 0
  age dq  0         ; int age = 0 
  age_in_dog_years dq 0
  age_in_year_2100 dq 0

  resultDogAge db "%s is %d dog years old.", 0ah, 0dh, 0

  resultAge2100 db "%s will be %d years old in the year 2100.", 0ah, 0dh, 0
