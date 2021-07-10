CODE   SEGMENT         ;CODE:代码段    
START:     
        ASSUME CS:CODE            ;关联段名与段寄存器                                                  
        MOV AX, 0      
        MOV CX, 5
S1:                             
        ADD AX,CX
        
        LOOP S1                   ;AX:000F

        MOV AH, 4CH                          
        INT 21H
CODE   ENDS                                 
END    START                                




        
 
                            
        
 
 