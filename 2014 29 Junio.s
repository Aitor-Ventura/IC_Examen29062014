## 2014 29 JUNIO

				.data
V:		.word 9,2,4,3,1,5,5,6,6,8,2
res:	.space 4

				.text
main:	li $t0,1	#t0 = i = 1
		li $t1,2	#t1 = lim_inf = 2
		li $t2,8	#t2 = lim_sup = 8
		li $t3,0	#t3 = suma
		li $t4,11	#t4 = num elem
		la $t5,V	#t5 carga la direccion del vector
		
para:	bgt $t0,$t4,finpara
		lw $s0,0($t5)	#s0 = V[i]
		
		ble $s0,$t1,sino	#V[i] > lim_inf
		
		bge $s0,$t2,sino	#V[i] < lim_sup
		
		andi $s0,$0,0
		
sino:	add $t3,$t3,$s0
		addi $t0,$t0,1
		addi $t5,$t5,4
		j para

finpara:	sw $t3,res
			jr $31