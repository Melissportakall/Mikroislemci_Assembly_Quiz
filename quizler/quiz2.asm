; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h

mov si,0
mov di,0
mov cx,6

dongu:
jcxz bitir

mov al,[sayilar+si]
mov tmp,al
cmp al,0
jl negatif
jg pozitif

pozitif:
inc si
dec cx
jmp dongu


negatif: 
CBW 
mov bl,4
idiv bl
cmp ah,0
je diziata
inc si
dec cx
jmp dongu


diziata:
mov al,tmp
mov [negatif4etambolunen+di],al
inc si
inc di
dec cx 
inc counter
jmp dongu

 



bitir:
ret

sayilar db -12,8,-6,-9,-13,-8
negatif4etambolunen db 0,0
tmp db 0
counter db 0
