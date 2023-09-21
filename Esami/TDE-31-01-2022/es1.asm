.data
	n: .word 4
.globl main
.text

main:
	la $a0, n
	jal numero_divisioni
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
# $a0 -> n
numero_divisioni:
	move $t1, $zero # count
	li $t3, 1 
	lw $t0, ($a0)
	blez $t0, out
	loop:
		beq $t3, $t0, end 
		rem $t2, $t0, $t3
		beqz $t2, then
		addi $t3, $t3, 1
		j loop
	then:
		addi $t1, $t1, 1
		addi $t3, $t3, 1
		j loop
	end:
		addi $t1, $t1, 1
		move $v0, $t1 
		jr $ra
	out:
		li $v0, 0
		jr $ra
	