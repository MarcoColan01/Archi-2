#Si supponga di poter usare soltanto i registri $s0 e $t0.
#Si scriva il codice assembly che:
#• calcoli la somma dei primi tre numeri interi positivi (1, 2 e 3), ciascuno
#moltiplicato per 3;
#• non si utilizzi la pseudo-istruzione mul.

.data

.text
	li $t0 1 
	addi $t0 $t0 1 
	addi $t0 $t0 1
	 
	add $s0 $s0 $t0
	
	subi $t0 $t0 1
	add $t0 $t0 $t0
	add $t0 $t0 $t0

	