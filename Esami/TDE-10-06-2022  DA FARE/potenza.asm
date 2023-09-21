.data 
	vet: .word 12 5 10 31 9
	insB: .asciiz "Inserisci b: "
	insX: .asciiz "Inserisci x: "
	sp: .ascii " "
	
.text
.globl main 

main:
	li $v0 4
	la $a0 insX
	syscall
	li $v0 5
	syscall 
	move $s0 $v0		#s0 = x
	
	li $v0 4
	la $a0 insB
	syscall
	li $v0 5
	syscall 
	move $s1 $v0		#s1
	
	move $a0 $s0
	move $a1 $s1
	jal calcolaPotenza
	move $a0 $v0 
	li $v0 1
	
calcolaPotenza:
	li $t0 2 
	li $t2 2
	li $t1 0
	
calcolo:
	addi $t1 $t1 1
	beq $t1 $a0 calcolo
	mul $t0 $t0 $t2
	j loop
	
torna: 
	move $v0 $t0
	jr $ra