.data

v: .word 9, 2, 4, 3, 1, 5, 5, 6, 6, 8, 2
suma: .space 4

.text

main: add $t0,$0,$t0   #t0(suma)= 0
      li $t1,1         #t1(indice)= 1
      li $t2,2         #t2(lim_inf)= 2
      li $t3,8         #t3(lim_sup)= 8
      li $t4,11        #t4(num elem)= 11
      la $t5,v         #t5 direccion del vector v

para: bgt $t1,$t4,finpara
      lw $s0,0($t5)   #s0 almacena los elem de v
      ble $s0,$t2,sino  #v[i] > lim_inf
      bge $s0,$t3,sino  #v[i] < lim_sup

      beq $s0,$0,finsi
      

sino: add $t0,$t0,$s0  #suma += v[i]

finsi: addi $t1,$t1,1
       addi $t5,$t5,4
       j para

finpara: sw $t0,suma  #t0 guarda suma
         jr $31