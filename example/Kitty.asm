write = 64 
exit = 93
nanosleep = 101

 ; original art by Joan Stark (https://oldcompcz.github.io/jgs/joan_stark/)

cat1 = "       \\    /\\\n        )  ( \')\n       (  /  )\njgs     \\(__)|\n"
cat2 = "      \\     /\\\n       |   ( \')\n       |  /  )\njgs     \\(__)|\n"
cat3 = "            /\\\n     _     ( \')\n      \\_  /  )\njgs     \\(__)|\n"
cat4 = "            /\\\n           ( \')\n       _  /  )\njgs  _/ \\(__)|\n"
cat5 = "            /\\\n           ( \')\n          /  )\njgs __/--(__)|\n"
cat6 = "            /\\\n           ( \')\n          /  )\njgs______(__)|\n"
cat7 = "            /\\\n           ( \')\n          /  )\njgs______(__)|\n"
cat8 = "            /\\\n           ( \')\n          /  )\njgs __--\\(__)|\n"
cat9 = "            /\\\n     _     ( \')\n      \\_  /  )\njgs     \\(__)|\n"
cat10 = "      \\     /\\\n       |   ( \')\n       |  /  )\njgs     \\(__)|\n"
cat11 = "       (    /\\\n        )  ( \')\n       (  /  )\njgs     \\(__)|\n"
cat12 = "        |   /\\\n        )  ( \')\n       (  /  )\njgs     \\(__)|\n"
resetCursor = "\r\e[4;A"
exitCursor = "\e[4;B"

sleep:
	li a7,nanosleep
	la a0,time
	li a1,0
	ecall
	ret
print:
	li a2,%cat1
	la a1,cat1
	mul a0,a0,a2
	add a1,a1,a0
	
	li a7,write
	li a0,0
	ecall
	
	li a7,write
	li a0,0
	la a1,resetCursor
	li a2,%resetCursor
	ecall
	ret

	
_start:
	li s0,0
	li s1,42; 36+6
	li s2,12
loop:
	mv a0,s0
	call print
	call sleep
	
	addi s0,s0,1
	remu s0,s0,s2
	addi s1,s1,-1
	bnez s1,loop

	li a7,write
	li a0,1
	la a1,exitCursor
	li a2,%exitCursor
	ecall
	
	li a7,exit
	li a0,0
	ecall

time:
	dd 0
	dd 100000000 ; 0.1
