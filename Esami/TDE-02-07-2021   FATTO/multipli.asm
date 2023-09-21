.data
	vet: .word 1 9 5 9 5
	ins1: .asciiz "Inserisci il primo numero: "
	ins2: .asciiz "Inserisci il secondo numero: "
	
.text 
.globl main 

main:
	li $v0 4 
	la $a0 ins1
	syscall
	li $v0 5
	syscall
	move $s0 $v0 
	
	li $v0 4 
	la $a0 ins2
	syscall
	li $v0 5
	syscall
	move $s1 $v0 
	
	bge $s0 $s1 sposta
	move $a0 $s0 		#a0 = valore maggiore
	move $a1 $s1		#a1 = valore minore
sposta:			
	move $a0 $s1
	move $a1 $s0 
	j continua
continua:
	jal funzione1 
	move $a0 $v0
	li $v0 1 
	syscall
	
	li $v0 10 
	syscall
	
	
funzione1: 
	div $a0 $a1
	mfhi $t0 
	beqz $t0 ok
	li $v0 0 
	j fine
	
ok:
	li $v0 1
	j fine
fine:
	jr $ra
	
	
