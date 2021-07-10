CODE SEGMENT
	        ASSUME CS:CODE
	START:
	        MOV       AX,8F1DH 
			SAR       AX,1        ;SAR: shift arithmetic right 算术右移指令——右移时保留符号位
			                      ; AX: C78EH
			SAL       AX,1        
			                      ; AX: 8F1CH
			MOV       AX,08F1DH

			MOV       CX,5
	
	REPEAT1:
			RCL       AX,1        ;RCL: 带进位循环左移（最高位移到CF，原来CF存储的数移到最低位）  
			LOOP      REPEAT1      
   
            MOV       CX,7
  
   REPEAT2:		
			RCR       AX,1        ;RCR: 带进位循环右移
			LOOP      REPEAT2     ; AX: E3C7H

			MOV       AH,4CH
			INT       21H
	
	CODE   ENDS
	        END       START