    .model small
    .stack 64
    .data
    mensaje1 db "ingresa por teclado un numeros:$"
    mensaje2 db "ingresa por teclado otro numeros:$"
    resultado db "la suma de los dos numeros es:$"
    numero1 db 0
    numero2 db 0
    suma db 0

    .code
      main proc
        mov ax,@data
        mov ds, ax
     ;recibir el primer numero
     mov ah, 09
     lea dx,[mensaje1]
     int 21h
     mov ah, 01
     int 21h  
     sub ax, 48 ;convierte ASCII a numero
     mov [numero1], al 
                 
     ;recibir el segundo numero
     mov ah, 09
     lea dx,[[mensaje2]]
     int 21h
     mov ah, 01
     int 21h 
      sub al, 48 ;convierte ASCII a numero
      mov [numero2], al 
                

      ;suma los numeros
     mov al,[numero1]
     add al,[numero2]
     mov [suma], al 

     ;mostrar resultado suma
     mov ah, 09
     lea dx, resultado
     int 21h
     mov ah, 02

     mov dl,[suma] 
     add dl, 48 ;convierte numero a ASCII
      int 21h
     ;fin
     mov ah,10 
     int 21h
 Main endp
 end Main    