 .model small
 .stack 1024
 .data
   nombre db "Wilson Perez! ","$"
  id db "74180299! ","$"

  .code
     main proc
     mov ax,@data
     mov ds, ax

     mov ah, 09
     lea dx, [nombre]
     int 21h
     lea dx, id
     int 21h
     
  ;mensaje por pantalla
     mov ax, 09
     int 21h

 main endp
 end main