DATA SEGMENT 
    ans DW ?
DATA ENDS
CODE SEGMENT 
    ASSUME CS:CODE, DS:DATA

    START:
    PUSH CS 
    POP DS 
    MOV AX,DATA
    MOV DS,AX
    MOV AX,10011000B
    MOV CX,5

L1: SUB AL,01000000B
    LOOP L1
    MOV  ans,AX

    MOV AH,4CH
    INT 21H
CODE ENDS
END START