# Alan Adrian Malagon Baeza 5CV1
	.text
	
	addi x3, x0, 10
a:
	addi x3,x3,-1
	bgt x3,x0, a
	
	li a7, 10
	ecall