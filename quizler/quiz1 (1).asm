
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
 

org 100h

lea bx,sayilar1
lea bp,sayilar2

mov SI,0
mov DI,0 


dongu:

mov ax,[bx+SI] 

idiv [bp+SI]


mov kalan[DI],ah 

mov al,kalan[DI]
imul sayi1
mov negatifkalan[SI],ax

add SI,2
inc DI



loop dongu

ret

sayilar1 dw  -13,70,-9,18

sayilar2 dw  3,17,6,10

kalan db 4 dup(?)

negatifkalan dw 4 dup(?)

sayi1 db -1