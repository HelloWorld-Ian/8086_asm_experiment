CODE SEGMENT
	        ASSUME CS:CODE
	START:
	        MOV       AX,8F1DH 
			SAR       AX,1        ;SAR: shift arithmetic right 算术右移指令——右移时保留符号位
			                      ; AX: C78EH
			SAL       AX,1        
			                      ; AX: 8F1CH
			MOV       AX,08F1DH
			RCL       AX,5        ;RCL: 带进位循环左移（最高位移到CF，CF移到最低位）  
			                      ; AX：E3B8H
			RCR       AX,7        ;RCR: 带进位循环右移
			                      ; AX: E3C7H
			MOV       AH,4CH
			INT       21H
	 CODE   ENDS
	        END       START