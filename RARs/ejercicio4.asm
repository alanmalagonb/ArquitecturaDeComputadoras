# Alan Adrian Malagon Baeza 5CV1
#-- Programa restador
#-- Inicializa el registro x6 a 0, le resta 1 y termina

	.text
	
	#-- Inicializar el registro x6 a 0
	addi x6, x0, 0
	
	#-- Restarle 1
	addi x6, x6, -1
	
	#-- Terminar
	li a7, 10
	ecall
