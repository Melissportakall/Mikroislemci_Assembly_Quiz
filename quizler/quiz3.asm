; multi-segment executable file template.

data segment
kelime1 db 'zapay'  
ends

extra segment
palindrom db 0

    
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov ax, extra 
    mov es, ax
    
    mov ax,0
    lea si,kelime1
    lea di,kelime1+4
    lea bx,palindrom
    
   
    
    mov cx,2
    
    dongu:
    jcxz bitir
    lodsb
    mov bl,ds:[di] 
    cmp al,bl
    je esit
    jne esitdegil
    dec di
    
    loop dongu
       
       
    esit:
    mov es:[palindrom],1
    dec cx
    dec di
    jmp dongu 
    
    esitdegil:
    mov es:[palindrom],0
    ;dec cx
    ;dec di
    jmp bitir 
    
   
    bitir:
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
