.data
	vet: .space 10
	msg1: .asciiz "Inserisci la dimensione dell'array (max 10): "
	msg2: .asciiz "Inserisci i valori: "
	ins: .asciiz "Inserisci l'elemento: "
	m: .asciiz "Minimo: " 
	M: .asciiz "Massimo: "
	
	
.text
.globl main

main:
	li $v0 4
	la $a0 msg1 
	syscall 
	
	li $v0 5
	syscall
	move $s0 $v0
	
	la $s1 vet 		#s1 = indirizzo base vet
	add $t0 $zero $s1	#t0 = indirizzo base vet
	li $t2 1		#t2 = indice i
	
lettura:
	li $v0 4
	la $a0 ins 
	syscall
	li $v0 5
	syscall 
	move $t1 $v0
	sw $t1($t0)
	addi $t0 $t0 4
	beq $t2 $s0 avanti
	addi $t2 $t2 1
	j lettura
	
avanti: 
	la $a0 vet 
	move $a1 $s0
	jal minimo
	li $v0 1
	move $a0 $v0
	syscall
	li $v0 10
	syscall
	
minimo:
	move $t0 $v0
	lw $t1($t0)	#t1 = elemento minimo
	li $t2 1
	
ricercaMin:
	addi $t0 $t0 4
	lw $t3($t0)
	blt $t3 $t1 scambioMin
c1:
	beq $t2 $a1 torna
	addi $t2 $t2 1 
	j ricercaMin
	
scambioMin:
	move $t1 $t3
	j c1	
	
torna:
	move $v0 $t1
	jr $ra
	

	
	
	 