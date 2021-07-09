DATA  SEGMENT
    ANS      DW 0
    INDEX    DW 7
DATA  ENDS
CODE  SEGMENT
    ASSUME    CS:CODE,DS:DATA
    START:
     MOV      AX,DATA
     MOV      DS,AX
    CALL      GETRES              ;call：将返回地址压入栈堆并调用子程序
     MOV      AH,4CH
     INT      21H

GETRES PROC
    MOV       AX,1                ;第一项：1
    MOV       BX,1                ;第二项：1
    MOV       DX,2                ;第三项：2
    CMP       INDEX,0             ;索引合法性判断
     JE       QUIT 
    CMP       INDEX,3             ;索引与3进行比较，如果小于3，则不需要进行累加计算，直接返回结果
    JBE       SKIP_ACC
    SUB       INDEX,3             ;索引减去3，得到需要累加的次数
    MOV       CX,INDEX
ACC:
    MOV       AX,BX               
    MOV       BX,DX
    MOV       DX,0
    SUB       INDEX,1
    ADD       DX,AX                  
    ADD       DX,BX               ;累加过程：BX赋值给AX，DX赋值给BX，DX=AX+BX
   LOOP       ACC
    MOV       ANS,DX
    JMP       QUIT

SKIP_ACC:
    CMP       INDEX,1             ;索引小于3时，需要直接返回结果
     JE       GET_I_1
    CMP       INDEX,2
     JE       GET_I_2
    CMP       INDEX,3
     JE       GET_I_3
    JMP       QUIT

GET_I_1:
    SUB       INDEX,1
    MOV       ANS,AX
    JMP       QUIT

GET_I_2:
    SUB       INDEX,1
    MOV       ANS,BX
    JMP       QUIT

GET_I_3:
    SUB       INDEX,1
    MOV       ANS,DX              ;ans：dx（000D）
    JMP       QUIT
 
QUIT:   
    RET   

GETRES ENDP


CODE  ENDS
END   START