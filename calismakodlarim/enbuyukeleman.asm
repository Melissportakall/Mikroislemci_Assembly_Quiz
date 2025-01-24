
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov si,0
mov cx,5

first:
mov al,[sayilar+si]
mov bl,[sayilar+si+1]
cmp al,bl
jg buyuk
jl kucuk
je esit


dongu:
jcxz bitir
mov al,bl
mov bl,[sayilar+si+1]
cmp al,bl
jg buyuk
jl kucuk
je esit
inc si
loop dongu

buyuk:
cmp enbuyuk,al
jg arttirma
mov enbuyuk,al
inc si
dec cx
jcxz bitir
jmp dongu


kucuk:
cmp enbuyuk,bl
jg arttirma
mov enbuyuk,bl
inc si
dec cx
jcxz bitir
jmp dongu

arttirma:
inc si
dec cx
jcxz bitir
jmp dongu 

esit:
jmp bitir

bitir:
ret
sayilar db 10,30,10,103,55
enbuyuk db 10


