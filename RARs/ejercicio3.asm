# Alan Adrian Malagon Baeza 5CV1
#-- Programa sumador
#-- Los registros x3, x4 y x5 se incrementan de forma independiente

	.text
	
	#-- Inicializar los registros x3, x4 y x5 a 0
	addi x3, x0, 0
	addi x4, x0, 0
	addi x5, x0, 0
	
bucle:
	#-- Incrementar el registro x3 en una unidad
	addi x3, x3, 1  #-- x3 = x3 + 1
	
	#-- Incrementar el registro x4 en tres unidades
	addi x4, x4, 3  #-- x4 = x4 + 3
	
	#-- Incrementar el registro x5 en cinco unidades
	addi x5, x5, 5  #-- x5 = x5 + 5
	
	#-- Repetir indefinidamente		
	b bucle
