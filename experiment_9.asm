DATA SEGMENT
	    TARGET      DB "created by ian in 2021/7/8"     ;define the target
	TARGET_LEN      DW 26                               ;length of target
	     QUERY      DB "ian"                            ;define the query
     QUERY_LEN      DW 3                                ;length of query
	      NEXT      DW -1
		   ANS      DB "$"
DATA ENDS	
CODE SEGMENT
	        ASSUME      CS:CODE, DS:DATA
	    START:  
	           MOV      AX,DATA
			   MOV      DS,AX

			   MOV      DI,0    ; initialize the ptr of query
			   MOV      SI,-1   ; initialize the matching index  
			  CALL      DP_PART ; get the array NEXT

			   MOV      DI,0    ; initialize the ptr of target
			   MOV      SI,0    ; initialize the ptr of query
			  CALL      MATCH

			   MOV      AH,09H
			   INT      21H 
			   MOV      AH,4CH
			   INT      21H

;==================================================	
; Match:动态规划匹配
; DI: ptr of tartget
; SI: ptr of query

		MATCH:
		       CMP      DI,[TARGET_LEN]     ;循环判断1:判断target是否完成遍历
			    JB      NEXT_JEDGE

			   
			   CMP      SI,[QUERY_LEN]      ;tartget完成遍历后，比较 query_ptr 与 query_len大小
			    JE      GET_ANS_TRUE        ;返回结果True or false
			   JMP      GET_ANS_FALSE
			   
   NEXT_JEDGE: 
	           CMP      SI,[QUERY_LEN]      ;循环判断2：判断query是否被完全匹配
			    JL      SUCCESS             ;若没有完全匹配，则进入循环
			   
			   CMP      SI,[QUERY_LEN]      ;若query被完全匹配，则返回结果true or false     
			    JE      GET_ANS_TRUE        
			   JMP      GET_ANS_FALSE

	  SUCCESS:  
	           CMP      SI,-1               
			    JE      MATCH_NEXT
			   MOV      CL,[TARGET+DI]
			   MOV      DL,[QUERY+SI]
			   CMP      CL,DL
			    JE      MATCH_NEXT          ; if k==-1||t.charAt(j)==q.charAt(k) => k++,j++ (MATCH_NEXT)
			   MOV      AX,2
			   MUL      SI
			  XCHG      AX,SI
			   MOV      SI,[NEXT[SI]]       ; else k=next[k]
			   JMP      MATCH

   MATCH_NEXT:  
               ADD      DI,1
			   ADD      SI,1
			   JMP      MATCH
	  
 GET_ANS_TRUE: 
               MOV      ANS,"T"
			   MOV      ANS+1,"$"
               MOV      DX,OFFSET ANS
			   RET

GET_ANS_FALSE: 
               MOV      ANS,"F"
			   MOV      ANS+1,"$"
               MOV      DX,OFFSET ANS
			   RET

;======================================================
; DP_PART: get the array next
; DI: the ptr of query
; SI: the matching index

	   DP_PART:
		       CMP      DI,[QUERY_LEN]        ; if finish the matching process =>quit; else => continue matching 
			   JAE      QUIT

               CMP      SI,-1
			    JE      GET_NEXT              ; if k==-1 => next[++j]=++k
			   MOV      CL,[QUERY+DI]         
			   MOV      DL,[QUERY+SI]
			   CMP      CL,DL                 ; if query.charAt(k)==query.charAt(j) => next[++j]=++k (GET_NEXT)
			    JE      GET_NEXT
			   MOV      AX,2                  
			   MUL      SI
			  XCHG      AX,SI
			   MOV      SI,[NEXT[SI]]         ; else => k=next[k]
			   JMP      DP_PART

	 GET_NEXT: ADD      DI,1                  
	           ADD      SI,1
			   MOV      AX,2
			   MUL      DI
			  XCHG      AX,DI
	           MOV      [NEXT+DI],SI
			  XCHG      AX,DI
			   JMP      DP_PART

		 QUIT: RET   
         
		 CODE  ENDS
	           END      START    		  
 		  
