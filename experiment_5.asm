CODE SEGMENT 
	      ASSUME      CS:CODE
	START:
	       pushf                      ;将标志寄存器的值压入堆栈顶部, 同时栈顶指针SP值减2

	         mov      ax, 0Fh
	         mov      bx, 01h
	         add      ax, bx 

	         mov      ax, 0FFh
	         mov      bx, 01h
	         add      ax, bx

	         mov      ax, 0FFFh
	         mov      bx, 01h
	         add      ax, bx

	         mov      ax, 0FFFFh
	         mov      bx, 01h
	         add      ax, bx

			popf                       ;与PUSHF相反, 从堆栈的顶部弹出两个字节送到PSW寄存器中, 同时堆栈指针值加2

	         mov      ax, 0FFFFh
			 mov      dx, 0FFFFh
	         mov      bx, 01h
	         add      ax, bx
			 adc      dx, 0            ;adc: 带进位的加法指令

             mov      ah, 4CH
			 int      21h
	        
       CODE ENDS
             END      START
       