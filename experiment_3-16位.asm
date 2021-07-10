DATA SEGMENT
        ANS DW 0
DATA ENDS
CODE  SEGMENT
              ASSUME    CS:CODE ,DS:DATA
              ORG       100H
      START:  
              MOV       AX,100H
              MOV       BX,100H
              MUL	AX               ;乘积放在AX中
                                         ;AX:0000 CF:1
              MOV       AH,4CH      
              INT       21H    
        CODE  ENDS
              END       START