#Si scriva il codice che calcola la somma dei primi N-1 numeri elevati al quadrato.
#Nel caso in cui l’i-esimo numero da aggiungere sia multiplo del valore iniziale
#della somma, si termini il ciclo for.

.data
	insV: .asciiz "Inserisci v: "
	insN: .asciiz "Inserisci n: "
	br: .asciiz "break"
.text
	li $v0 4
	la $a0 insV
	syscall
	li $v0 5
	syscall
	move $t0 $v0	#t0 = V
	
	li $v0 4
	la $a0 insN
	syscall
	li $v0 5
	syscall
	move $t1 $v0	#t1 = N 
	move $s0 $t1	#s0 = SUM
	
	li $t2 1	#t2 = i
	
loop:
	beq $t2 $t1 fine 
	mult $t2 $t2
	mflo $t3
	div $t3 $t0
	mfhi $t4 
	beqz $t4 stop
	add $s0 $s0 $t3
	addi $t2 $t2 1
	j loop

stop:
	li $v0 4
	la $a0 br 
	syscall
	j fine
	
fine:
	li $v0 1
	move $a0 $s0
	syscall
	
	
	