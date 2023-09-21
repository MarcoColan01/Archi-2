.data 
	vettore: .word 2 3 0 2 7
.globl main

.text

main:
	
	la $s0, vettore	
	li $s2, 5     # n
	li $s3, 1 # count
	loop:
		beq $s3, $s2, end
		lw $a0, ($s0)
		lw $a1, 4($s0)
		jal pippo
		sw $v0, ($s0)
		addi $s0, $s0, 4
		addi $s3, $s3, 1
		j loop
	end:
		la $a0, vettore
		move $a1, $s2
		jal print_vector
	li $v0, 10
	syscall

# a0 vettore
# a1 n
print_vector:
	move $t1, $a0 
	loop1:
		beqz $a1, end1
		lw $t0, ($t1)
		li $v0, 1
		move $a0, $t0
		syscall
		addi $t1, $t1, 4
		sub $a1, $a1, 1
		j loop1
	end1:
		jr $ra

pippo:
	move $t0, $a0
	move $t1, $a1
	add $v0, $t0, $t1
	jr $ra

	
