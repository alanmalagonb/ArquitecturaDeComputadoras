# Alan Adrian Malagon Baeza - 5CV1
# Práctica - Ordenamiento por Inserción
# Directiva de código
.text
# Cargar datos 50 27 31 10 5 18 40
addi t0, x0, 40
addi t1, x0, 18
addi t2, x0, 5
addi t3, x0, 10
addi t4, x0, 31
addi t5, x0, 27
addi t6, x0, 50

# Cargar datos en memoria
sw t0, 0(x0)
sw t1, 4(x0)
sw t2, 8(x0)
sw t3, 12(x0)
sw t4, 16(x0)
sw t5, 20(x0)
sw t6, 24(x0)

# Ordenamiento por inserción
addi s1, x0, 1   # s1 = índice i
addi s2, x0, 7   # N = 7

for_i:
    addi t0, s1, 0     # t0 = i
    addi t1, t0, -1    # t1 = i - 1
    slli t0, t0, 2     # dirección alineada i
    slli t1, t1, 2     # dirección alineada i - 1
    lw t2, 0(t0)       # t2 = Mem[i]

    for_j:
        beqz t1, done       # Si hemos alcanzado el inicio del arreglo, terminamos
        lw t3, 0(t1)       # t3 = Mem[i - 1]
        slt t4, t3, t2    # (t3 < t2)
        bnez t4, shift     # Si t3 < t2, saltamos a shift

        sw t3, 0(t0)       # Mem[i] = Mem[i - 1]
        addi t0, t0, -4    # Decrementamos la dirección de i
        addi t1, t1, -4    # Decrementamos la dirección de i - 1
        j for_j            # Volvemos a comprobar el siguiente elemento

    shift:
        sw t2, 0(t0)       # Mem[i] = t2
        j next_i            # Pasamos al siguiente elemento del arreglo

    done:
        addi s1, s1, 1       # Incrementamos el índice i
        j for_i              # Volvemos a iterar para el siguiente elemento

next_i:

# Resultado ordenado almacenado en memoria
