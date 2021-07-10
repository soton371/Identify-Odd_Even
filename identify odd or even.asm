.MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT_1  DB  'Enter the number 0 to 9 : $'
    PROMPT_2  DB  0DH,0AH,'The number is : $' 
    PROMPT_3  DB  'EVEN'
    PROMPT_4  DB  'ODD'

 .CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX                   

     LEA DX, PROMPT_1             
     MOV AH, 9
     INT 21H

     MOV AH, 1                    
     INT 21H

     MOV BL, AL                    
     
     LEA DX, PROMPT_2             
     MOV AH, 9
     INT 21H

     TEST BL, 01H                 

     JNE @ODD                     

     MOV AH, 2                    
     MOV DL, PROMPT_3
     INT 21H

     JMP @EXIT                    

     @ODD:                        
       MOV AH, 2                  
       MOV DL, PROMPT_4
       INT 21H

     @EXIT:                       

     MOV AH, 4CH                  
     INT 21H
   MAIN ENDP 
 END MAIN
