.data
	array1: .word 1 9 5 9 5
	array2: .word 4 3 3 8 15
.globl main

.text

main:
	la $a0, array1
	la $a1, array2
	li $a2, 5
	jal conta_multipli
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
multiplo:
	rem $t0, $a0, $a1
	rem $t1, $a1, $a0
	beqz $t0, end
	beqz $t1, end
	li $v0, 0
	jr $ra
	end:
		li $v0, 1
		jr $ra
		
conta_multipli:
	move $s0, $zero
	move $s1, $a0
	move $s2, $a1
	addi $sp, $sp, -4
	sw $ra, ($sp)
	loop:
		beqz $a2, endloop
		lw $t3, ($s1)
		lw $t4, ($s2)
		move $a0, $t3
		move $a1, $t4
		
		jal multiplo
		add $s0, $s0, $v0
		subi $a2, $a2, 1
		addi $s1, $s1, 4
		addi $s2, $s2, 4
		j loop
	endloop:
		move $v0, $s0
		lw $ra, ($sp)
		addi $sp, $sp, 4
		jr $ra
	