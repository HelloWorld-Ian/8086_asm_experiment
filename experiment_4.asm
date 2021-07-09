CODE SEGMENT
            ASSUME CS:CODE
	 START:
	           MOV      AX,100H       ;若除数为8位，则被除数为16位，被除数默认放在AX中，若除数为16位，则被除数为32位，被除数高
			                          ;16位存放在DX，被除数低16位存放在AX
			  
			   MOV      BX,100H       ;除数放在bx
			   DIV      BX            ;AX:0001 DX:0000
			                          
									  ;除数为8位时，AL存放商，AH存放余数，除数为16位时，AX存放商，DX存放余数

			   MOV      AX,0F0FH
			   MOV      BX,00FFH
			   DIV      BX            ;AX:000F DX:001E
	  CODE    ENDS
	           END      START     