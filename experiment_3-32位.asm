DATA SEGMENT
        ANS DW 0
DATA ENDS
CODE  SEGMENT
              ASSUME    CS:CODE ,DS:DATA
      START:  
              MOV       AX,0F0FH
              MOV       BX,0FF00H
              CALL      MULT32            
              MOV       AH,4CH
              INT       21H
  
;====================================================
; 被乘数放置于ax 中， 乘数放置于 bx中, 结果放置于dx/ax中
      
      MULT32  PROC                       ; PROC_NAME PROC ：定义process 
              PUSH      SI               ; SI:变址寄存器，用于存放源操作数的地址偏移量，此处用于存放低16位
                                         ; PUSH:将SI中的内容送入SS:SP所指向的内存单元  
              PUSH      DI               ; DI:变址寄存器，用于存放目标操作数的地址偏移量，此处用于存放高16位
              PUSHF
              MOV       DX,0
              MOV       SI,0
              MOV       DI,0
              CMP       BX,0
              JE        @@MULTEXIT
    @@MULT1:
              SHR       BX,1             ;SHR（逻辑右移）：向右位移一位，最左侧用0补齐，将移出的一位写入CF中
              JNC       @@MULT2          ;JNC：转移指令，如果进位CF=0则跳转，跳过部分积相加的过程 
              ADD       SI,AX
              ADC       DI,DX            ;ADC:两数相加再加上低位存储的进位
    @@MULT2:
              SHL       AX,1
              RCL       DX,1             ;RCL:带进位循环左移（左移之后最低位用CF位填充） RCR:带进位循环右移（右移之后最高位用CF位填充）
              CMP       BX,0
              JNE       @@MULT1
              MOV       DX,DI            ;DX存放高16位
              MOV       AX,SI            ;AX存放低16位
              MOV       ANS,AX
              MOV       ANS+2,DX
              POPF 
              POP       DI               ;POP:将SSS:SP所指向的内存单元中的内容送入DI中
              POP       SI
              RET                        ;RET：return
 @@MULTEXIT:
              MOV       AX,0
              POPF
              POP       DI
              POP       SI
              RET
      MULT32  ENDP                       ;ENDP:PROC（process）结束符
;==================================       
 
        CODE  ENDS
              END       START