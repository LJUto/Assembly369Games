%include "io64.inc"

section .text
global CMAIN
CMAIN:
    mov rbp, rsp; for correct debugging
    ;write your code here
    GET_DEC 1, ax       ;ax에 피제수를 input을 통해 입력
    mov bl, 10          ;bl에 제수 10을 입력
        
    div bl              ;ax/bl 진행, 몫은 ax, 나머지는 ah 저장
    mov bl, ah          ;ah는 바로 출력 불가, bl에 ah 값 저장
        
    cmp al, 3           ;al과 3의 값을 비교
    je L_equal1         ;al과 3의 값을 비교 후 같으면 L_equal1로 이동
    cmp al, 6           ;al과 6의 값을 비교
    je L_equal1         ;al과 6의 값을 비교 후 같으면 L_equal1로 이동
    cmp al, 9           ;al과 9의 값을 비교
    je L_equal1         ;al과 9의 값을 비교 후 같으면 L_equal1로 이동
    PRINT_DEC 1, al     ;al의 값을 10진수로 출력
    jmp L_equal_end1    ;L_equal_end1로 이동
    
L_equal1:
    PRINT_STRING msg    ;msg의 값을 문자로 출력
L_equal_end1:

    cmp bl, 3           ;bl과 3의 값을 비교      
    je L_equal2         ;b1과 3의 값을 비교 후 같으면 L_equal2로 이동
    cmp bl, 6           ;b1과 6의 값을 비교
    je L_equal2         ;b1과 6의 값을 비교 후 같으면 L_equal2로 이동
    cmp bl, 9           ;b1과 9의 값을 비교
    je L_equal2         ;b1과 9의 값을 비교 후 같으면 L_equal2로 이동
    PRINT_DEC 1, bl     ;b1의 값을 10진수로 출력
    jmp L_equal_end2    ;L_equal_end2로 이동
    
L_equal2:
    PRINT_STRING msg    ;msg의 값을 문자로 출력
L_equal_end2:
    
    xor rax, rax
    ret
    
section .data
    msg db "_", 0x00    ;"_"의 값을 저장한 변수 정의
section .bss