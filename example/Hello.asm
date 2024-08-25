
write = 64
exit = 93

helloM = "Hello\n"
byeM = "Bye\n" 
_start:
	li a7,write
	li a0,1
	la a1,helloM
	li a2,%helloM
	ecall

	li s0,300000000 ; This is a bad way to wait <w>
wait:
	addi s0,s0,-1 
	bne s0,0,wait 
	
	li a7,write
	li a0,1
	la a1,byeM
	li a2,%byeM
	ecall
	
	li a7,exit
	li a0,69
	ecall
