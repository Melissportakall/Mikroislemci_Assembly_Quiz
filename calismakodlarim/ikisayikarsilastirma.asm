
org 100h

;iki sayiyi karsilastiran kod

mov al,sayi1
mov bl,sayi2

cmp al,bl
jg buyuk  ;jgreater buyuk
jl kucuk  ;jless kucuk
je esit   ;jequals esit

buyuk:
mov ax,1
jmp bitir

kucuk:
mov ax,-1
jmp bitir

esit:
mov ax,0
jmp bitir

bitir:
ret
sayi1 db 28
sayi2 db 28

