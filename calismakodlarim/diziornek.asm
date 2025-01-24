; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

lea si,sayilar
mov cx,8
mov bl,5

dongu: 
JCXZ bitir
mov al,[si]
cmp al,bl
JE esit
dec cx
inc si
jmp dongu

esit:
inc bessayisi
inc si
dec cx
jmp dongu

bitir:
ret
;dizideki 5 sayisini hesaplayan kod

sayilar db {0,1,5,2,5,5,5,5}
bessayisi db 0
