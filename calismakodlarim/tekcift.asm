; multi-segment executable file template.

data segment
dizi db 1,2,3,4,5,6   
ends

extra segment
teksayilar db 0,0,0
ciftsayilar db 0,0,0
tmp db 0    
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
    
    ;dizideki tek sayilari tek dizisine cift sayilari cift dizisine 
    
    lea si,dizi
    lea di,teksayilar
    lea bx,ciftsayilar
    lea dx,tmp
    
    mov ax,0
    mov cx,6
    
    dongu:
    jcxz bitir
    lodsb
    mov es:[tmp],al
    mov ah,0
    mov dl,2 
    div dl
    cmp ah,0
    je cift
    jne tek 
    
    loop dongu
    
    cift:
    mov al,es:[tmp]
    mov es:[bx],al
    dec cx
    inc bx
    jmp dongu
    
    tek:
    mov al,es:[tmp]
    mov es:[di],al
    dec cx
    inc di
    jmp dongu
    
    bitir:
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
