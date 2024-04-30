.model small
    .stack 64
    .data
    mensaje1 db "ingresa por teclado un numero(dividendo):$"
    mensaje2 db "ingresa por teclado otro numero(divisor):$"
    resultado db "la division(cociente) de los dos numeros es:$"
    dividendo dw 0
    divisor dw 0
    cociente dw 0
    cociente_str db 5 dup(0);datos del cociente
    .code
    
    Main proc
     mov ax, @data
     mov ds, ax

     ;recibir el dividendo o numero por teclado
     mov ah, 09
     lea dx,[mensaje1]
     int 21h
     mov ah, 1
     int 21h  
     sub al, "0"
     mov [dividendo], ax 
                 
     ;recibir el divisor o numero por teclado
     mov ah, 09
     lea dx,[mensaje2]
     int 21h
     mov ah, 1
     int 21h 
      sub al, "0"
      mov [divisor], ax 
                

      ;dividir los numeros ingresados por teclado
     mov ax,[dividendo]
     cwd ;extiende el signo dx para division con signo
     idiv word ptr [divisor]
     mov [cociente], ax

     ;mostrar cociente en cadena caracteres
     mov ax, [cociente]
      mov bx, 10 ;convertir a decimal
      lea di, [cociente_str +4]
     
      ;convertir a cadena 
     xor dx, dx
     div bx
      add dl, "0"
      dec di
      mov [di], dl
      test ax, ax 
      label 

     ; mostrar resultado
      mov ah, 9
      lea dx, [resultado]
      int 21h

      ;mostrar resultado pantalla de la division
      mov ah, 9
      lea dx, [di]
      int 21h

     ;fin
     mov ah, 4ch 
     int 21h
 Main endp
 end Main    

