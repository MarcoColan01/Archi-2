.data
	vet: .space 10
	msg1: .asciiz "Inserisci la dimensione dell'array (max 10): "
	msg2: .asciiz "Inserisci i valori: "
	ins: .asciiz "Inserisci l'elemento: "
	m: .asciiz "Minimo: " 
	M: .asciiz "Massimo: "
	sp: .asciiz " "
	
	
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
	move $a0 $v0
	li $v0 1
	syscall
	
	li $v0 4
	la $a0 sp
	syscall 
	
	la $a0 vet 
	move $a1 $s0
	jal massimo
	move $a0 $v0
	li $v0 1
	syscall
	li $v0 10
	syscall
	
minimo:
	move $t0 $a0
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
	
	
	
massimo:
	move $t0 $a0
	lw $t1($t0)	#t1 = elemento massimo
	li $t2 1
	
ricercaMax:

	addi $t0 $t0 4
	lw $t3($t0)
	bgt $t3 $t1 scambioMax
c2:
	beq $t2 $a1 torna
	addi $t2 $t2 1 
	j ricercaMax
	
scambioMax:
	move $t1 $t3
	j c2
	
torna:
	move $v0 $t1
	jr $ra
	

	
	
	 
