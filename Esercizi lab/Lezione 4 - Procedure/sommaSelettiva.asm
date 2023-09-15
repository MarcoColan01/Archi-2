.data
	vet: .space 6
	ins: .asciiz "Inserisci l'elemento: "
	insK: .asciiz "Inserisci il parametro K: "
	
.text
.globl main

main:
	li $t2 1
	la $t0 vet 
loop:
	li $v0 4 
	la $a0 ins 
	syscall
	li $v0 5 
	syscall 
	move $t1 $v0 
	sw $t1($t0)
	beq $t2 6 continua
	addi $t2 $t2 1
	addi $t0 $t0 4
	j loop

continua: 	
	li $v0 4 
	la $a0 insK
	syscall
	li $v0 5 
	syscall 
	move $a0 $v0 
	la $a1 vet
	jal P
	
	move $a0 $v0
	li $v0 1
	syscall
	li $v0 10
	syscall
	
P:
	li $t4 2
	la $t0($a1) 	#a0 = indirizzo vet
	li $t1 0	#t1 = indice i
	li $t2 0	#t2 = somma
	
loop2:
	beq $t1 6 fine
	lw $t3($t0)
	div $t1 $t4
	mfhi $t5
	beqz $t5 sommaPari	#sommo i pari
	bnez $a0 avanti 
	add $t2 $t2 $t3		#altrimenti i dispari
avanti:
	addi $t1 $t1 1
	addi $t0 $t0 4
	j loop2

sommaPari:
	bne $a0 1 salta
	add $t2 $t2 $t3
salta:
	j avanti

fine:
	move $v0 $t2
	jr $ra
	