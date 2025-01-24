; multi-segment executable file template.

data segment
dizi1 db 12,3,5,20
 
ends 

extra segment
dizi2 db 12,8,5,7
dizi3 db 0,0,0,0    
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ax, data
    mov ds, ax
    mov ax, extra
    mov es, ax 
     
    ;ds deki diziyi es deki dizi2 ye kopyalama -> movsb
    ;ds:[si] deki veriyi al reg kopyalar -> lodsb 
    ;al deki veriyi es:[di] ye kopyalar. -> stosb
    ;ds:[si] deki veriyi es:[di] deki veriyle karsilastirir.
    ;al deki veriyle es:[di] deki veriyi karsilastirir. 
    LEA si,dizi1
    Lea di,dizi2 
    Lea bx,dizi3
    ;ikdi diziyi karsilastirip ayni olan elemanlari dizi3 e atan kod
    
    mov ax,0
    mov cx,4
    
    dongu:
    jcxz bitir
    lodsb ;ds:[si] -> al
    cmp al,es:[di]
    jne farkli
    mov es:[bx],al
    inc bx
    inc di
    loop dongu
              
         
    
    farkli:
    inc di 
    dec cx
    jmp dongu          
              
    bitir:     
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
