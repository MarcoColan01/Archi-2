#Si scriva il codice assembly che:
#• inizializzi il segmento dati con un array di 13 interi scelti a piacere;
#• chieda all’utente di inserire tre interi a, b e c;
#• se c=0, scambi l’a-esimo elemento dell’array con il b-esimo;
#• se c=1, sovrascriva il b-esimo elemento dell’array con il valore dell’a-esimo
#elemento;
#• se c=-1, sovrascriva l’a-esimo elemento dell’array con il valore del b-esimo
#elemento;
#• se c ha un altro valore stampi la stringa «comando non riconosciuto» e
#non effettui modifiche all’array.


.data
	vet: .word 1 2 3 4 5 6 7 8 9 10 11 12 13
	insA: .asciiz "Inserisci a: "
	insB: .asciiz "Inserisci b: "
	insC: .asciiz "Inserisci c: "
	err: .asciiz "Comando non riconosciuto"
.text
	li $v0 4
	la $a0 insA 
	syscall
	li $v0 5
	syscall 
	move $s0 $v0	#s0 = a
	
	li $v0 4
	la $a0 insB 
	syscall
	li $v0 5
	syscall 
	move $s1 $v0	#s1 = b
	
	li $v0 4
	la $a0 insC 
	syscall
	li $v0 5
	syscall 
	move $s2 $v0	#s2 = c
	
	la $s3 vet	#t0 = indirizzo base vet
	
	beqz $s2 op1
	beq $s2 1 op2
	beq $s2 -1 op3
	
op1: 
	mul $t1 $s0 4
	mflo $t1
	add $t1 $t1 $s3
	lw $t0($t1)	#t1 = indirizzo vet[a]
	
	mul $t2 $s1 4
	mflo $t2
	add $t2 $t2 $s3
	lw $t3($t2) 
	
	sw $t3($t1)
	sw $t0($t2)
	j fine
	
op2:
	mul $t1 $s0 4
	mflo $t1
	add $t1 $t1 $s3
	lw $t0($t1)		#t1 = indirizzo vet[a]
	
	mul $t2 $s1 4
	mflo $t2
	add $t2 $t2 $s3		#t2 = indirizzo vet[b]
		 	
	sw $t0($t2)
	j fine
	
op3:
	mul $t1 $s0 4
	mflo $t1
	add $t1 $t1 $s3		#t1 = indirizzo vet[a]
			
	
	mul $t2 $s1 4
	mflo $t2
	add $t2 $t2 $s3		#t2 = indirizzo vet[b]
	lw $t3($t2)	
	
	sw $t3($t1)
	j fine
	
fine:
	