# Alan Adrian Malagon Baeza - 5CV1
#Practica- Ordenamiento Burbuja
#Directiva de codigo
.text 
#Cargar datos 50 27 31 10 5 18 40
		addi	t0, x0, 40
		addi	t1, x0, 18
		addi	t2, x0, 5
		addi	t3, x0, 10
		addi	t4, x0, 31
		addi	t5, x0, 27
		addi	t6, x0, 50
#cargar datos en memoria
		sw	t0, 0(x0)
		sw	t1, 4(x0)
		sw	t2, 8(x0)
		sw	t3, 12(x0)
		sw	t4, 16(x0)
		sw	t5, 20(x0)
		sw	t6, 24(x0)
		
#Buble externo
		addi	s1, x0, 0		#s1 = indice i
		addi	s2, x0, 6		#N = 6
for_i:
		addi	s0, x0, 0		#s0 = indice j
#for (j=0; j<N; j++)
for_j:
#t0 = j
#t1 = j + 1
		slli	t0, s0, 2		#direccion alinead j
		addi	t1, t0, 4		#Direccion alineada j+1
		lw	t2, 0(t0)		#t2 = Mem[j]
		lw	t3, 0(t1)		#t3 = Mem[j+1]
		slt	t4, t3, t2		#(t3 < t2)
		beq	t4, x0, fin_if		#salta a fin_if si t4 = 1
		sw	t3, 0(t0)
		sw	t2, 0(t1)
#fin del if
fin_if:
		addi	s0, s0, 1		#j = j + 1
		bne	s0, s2, for_j		#Si no hemos alcanzado el limite 
		
		addi	s1, s1, 1
		bne	s1, s2, for_i
