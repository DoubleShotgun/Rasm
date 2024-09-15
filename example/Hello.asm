exit = 93
write = 64

string = "Hello World!\n"

_start:
	li a7,write
	li a0,0
	la a1,string
	li a2,%string
	ecall
	
	li a7,exit
	li a0,0
	ecall
