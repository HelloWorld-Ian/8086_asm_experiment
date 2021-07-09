DATA SEGMENT 
	 STORE    DW      -1
DATA ENDS
CODE SEGMENT 
	       ASSUME   CS:CODE,DS:DATA
	START:
	       MOV      AX,DATA
		   MOV      DS,AX
	       MOV      DI,0 
	       MOV      AX,71D2H
		   MOV      BX,5DF1H
		   MOV      CX,2
MOVERIGHT:                         ;SHRD:双精度右移，第一个操作数右移n位，空出的n位用第二个操作数末尾n位补齐
           SHR      BX,1
		   RCR      AX,1
		   ADC      SI,0
		   MOV      [STORE[DI]],SI
		   MOV      SI,0
		   ADD      DI,2
		  LOOP      MOVERIGHT
           MOV      CX,2          
 RESTORE1:
           SHL      BX,1
		   ADD      BX,[STORE[DI]]
		   SUB      DI,2
		  LOOP      RESTORE1        ;AX:5C74H BX:5DF1H

		  XCHG      AX,BX 
           MOV      CX,4
		   MOV      DI,0
 MOVELEFT:                          ;SHLD:双精度左移，第一个操作数左移n位，空出的n位用第二个操作数首n位补齐
           SHL      BX,1
		   RCL      AX,1
		   ADC      SI,0
		   MOV      [STORE[DI]],SI
		   MOV      SI,0
		   ADD      DI,2
		  LOOP      MOVELEFT
           MOV      CX,4
		   MOV      SI,0

 RESTORE2:
           SUB      DI,2
		   MOV      SI,[STORE[DI]]
		   SHR      SI,1
           RCR      BX,1
		  LOOP      RESTORE2        ;AX:DF15H BX:5C74H
       
		   MOV      AH,4CH
		   INT      21H
CODE ENDS
           END      START