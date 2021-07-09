CODE SEGMENT
	       ASSUME CS:CODE
   START:
	       mov ax,21    ;ax:0015
	       mov bx,71    ;bx:0047
	       add ax,bx
	       daa          ;ax:0062

	       mov ax,12    ;ax:000c
	       mov bx,49    ;bx:0031
	       add ax,bx
	       daa          ;ax:0043

	       mov ax,65    ;ax:0041
	       mov bx,82    ;bx:0052
	       add ax,bx
	       daa          ;ax:0093
		     
	       mov ax,46    ;ax:002e
	       mov bx,33    ;bx:0021
	       sub ax,bx    
	       das          ;ax:0007      ax低四位大于9，ax=ax-06h , ax高四位大于9，ax=ax-60h

	       mov ax,74    ;ax:004a
	       mov bx,58    ;bx:003a
	       sub ax,bx    
	       das          ;ax:0010

	       mov ax,43    ;ax:002b
	       mov bx,54    ;bx:0036
	       sub ax,bx
	       das          ;ax:FF95
 
	       mov ax,21    
	       mov bx,71
	       add ax,bx
	       aaa          ;ax:0102

	       mov ax,12
	       mov bx,49
	       add ax,bx
	       aaa          ;ax:0103

	       mov ax,65
	       mov bx,82
	       add ax,bx
	       aaa          ;ax:0003

	       mov ax,46
	       mov bx,33
	       sub ax,bx
	       aas          ;ax:FF07

	       mov ax,74
	       mov bx,58
	       sub ax,bx
	       aas          ;ax:0000

	       mov ax,43
	       mov bx,54
	       sub ax,bx
	       aas          ;ax:FF05

	CODE  ENDS
	       END START
             
	       
	    

