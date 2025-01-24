; multi-segment executable file template.

data segment
dizi1 db 10,20,30,40
ends

extra segment
dizi2 db 0,0,0,0
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov ax,extra
    mov es,ax
    
    lea si,dizi1
    lea di,dizi2
    
    add di,3
    
    mov ax,0
    mov cx,4
    
    dongu:
    lodsb
    mov es:[di],al
    dec di
    loop dongu

    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
