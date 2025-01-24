
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AH,02H
MOV BH,0
MOV DH,10
MOV DL,10
int 10h

MOV AH,00H
int 16H

sub al,48
cbw      
mov bl,3
div bl 
mov al,ah      
add al,48      

mov ah,09h
mov dh,10
mov dl,10
mov bl,11110000b
mov cx,1
int 10h

mov cx,4
dongu:
push cx
inc dl
inc dh
MOV AH,02H
int 10h

MOV AH,00H
int 16H

sub al,48
cbw      
mov bl,3
div bl 
mov al,ah      
add al,48      

mov ah,09h
mov bl,11100000b
mov cx,1
int 10h

pop cx
loop dongu

ret

temp db 3