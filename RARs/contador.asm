# Alan Adrian Malagon Baeza 5CV1
#-- Programa contador
#-- El registro x5 se incremeta indefinidamente

	.text
	
	#-- Inicializar el registro x5 a 0
	addi x5, x0, 0
	
bucle:
	#-- Incrementar el registro x5 en dos unidades
	addi x5, x5, 2  #-- x5 = x5 + 2
	
	#-- Repetir indefinidamente		
	b bucle