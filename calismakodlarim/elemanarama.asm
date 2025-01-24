; multi-segment executable file template.

data segment
dizi1 db 3,7,10,15
tmp db 0  
ends

extra segment
index db  0   
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
    lea di,index
     
    mov cx,4
    mov ax,0
    mov es:[di],10
    
   
    dongu:
    
    lodsb 
    cmp al,10
    je bulduk
    inc tmp
    
    loop dongu 
    
    bulduk:
    mov al,0
    mov al,[tmp]
    mov es:[di],al
    jmp bitir
    
    
    bitir:
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
