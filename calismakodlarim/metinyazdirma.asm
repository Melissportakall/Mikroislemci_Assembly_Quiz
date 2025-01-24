
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

lea si,metin
mov cx,sayac - offset metin

dongu:

push cx

mov ah,0ah  ;imlec karakter yazma
mov al,[si]
mov bh,0
mov cx,1

inc si 
int 10h

mov ah,03h ;imlec pozisyonunu okuma
int 10h

mov ah,02h ;imlec pozisyonunu ayarlama
inc dl
int 10h

pop cx 

loop dongu

ret
metin db 'ekranayazdirma'
sayac db 0


