CODE   SEGMENT         ;CODE:代码段    
START:     
        ASSUME CS:CODE                                                             
        MOV AX, 0      
        MOV CX, 5
S1:                             
        MOV AX,CX
        
        LOOP S1
        MOV AH, 4CH                          
        INT 21H
CODE   ENDS                                 
END    START                                




        
 
                            
        
 
 