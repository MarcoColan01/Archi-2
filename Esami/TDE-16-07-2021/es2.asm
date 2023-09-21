.data 
	array1: 1 2 4 3
	array2: 3 1 6 3
	
.globl main

.text

main:
	la $a0, array1
	la $a1, array2
	li $a2, 4
	jal numero_vittorie
	move $a0, $v0
	li $v0, 1
	syscall
	move $a0, $v1
	syscall
	li $v0, 10
	syscall
	

numero_vittorie:
	move $t0, $a0
	move $t1, $a1
	move $t2, $a2
	move $t3, $zero #count primo array
	move $t4, $zero #count secondo array
	addi $sp, $sp, -4
	sw $ra, ($sp)
	loop:
		blez $t2, endloop
		subi $t2, $t2, 1
		lw $a0, ($t0)
		lw $a1, ($t1)
		jal lancio_singolo
		beq $v0, 1 winfirst
		beq $v0, 2 winsecond
		j else
		winfirst:
			addi $t3, $t3, 1
			j else
		winsecond:
			addi $t4, $t4, 1
		else:
			addi $t0, $t0, 4
			addi $t1, $t1, 4
			j loop 
		endloop:
			lw $ra, ($sp)
			addi $sp, $sp 4
			move $v0, $t3
			move $v1, $t4
			jr $ra 

lancio_singolo:
	beq $a0, $a1 equal
	blt $a0, $a1 less
	bgt $a0, $a1 great
	
	equal:
		li $v0, 0
		jr $ra
	great:
		li $v0, 1
		jr $ra
	less:
		li $v0, 2
		jr $ra
