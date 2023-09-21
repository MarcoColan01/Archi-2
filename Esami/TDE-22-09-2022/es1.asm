.data
	array: .byte '1' '2' '3' '4' '5' '6' '7' 'J' 'Q' 'K' '1' '2' '3' '4' '5' '6' '7' 'J' 'Q' 'K' '1' '2' '3' '4' '5' '6' '7' 'J' 'Q' 'K' '1' '2' '3' '4' '5' '6' '7' 'J' 'Q' 'K' 
 .globl main
 
 .text
 
 main:
 	la $a0, array
 	li $a1, 40
 	jal mescola
 	la $a0, array
 	li $a1, 40
 	jal print_array
 	la $a0, array
 	li $a1, 3
 	jal score
 	move $a0, $v0
 	li $v0, 1
 	syscall
 	li $v0, 10
 	syscall
 	
 mescola:
 	move $t0, $a0
 	move $t1, $a1
 	li $t2, 100 #count
 	addi $sp, $sp, -4
 	sw $ra, ($sp)
 	loop:
 		beqz $t2, endloop
 		jal random_card
 		move $t5, $v0
 		move $t3, $v1
 		jal random_card
 		move $t4, $v1
 		move $t6, $v0
 		sb $t3, ($t6)
 		sb $t4, ($t5)
 		addi $t2, $t2, -1
 		j loop 
 	endloop:
 		lw $ra, ($sp)
 		addi $sp, $sp, 4
 		jr $ra
 
random_card:
	la $s0, array
	loop2:
 			li $v0, 41
 			li $a0, 27
 			syscall
 			blez $a0, loop2
 		rem $a0, $a0, 40
 		add $a0, $a0, $s0
 		lb $s1, ($a0)
 		move $v0, $a0
 		move $v1, $s1
 		jr $ra
 		
 		
 		
score:
	move $t0, $a0
	move $t1, $a1
	move $t4, $zero #somma

	loop4:
		beqz $t1, endloop4
		lb $t3, ($t0)
		bge $t3, 58, then
		subi $t3, $t3, 48 
		add $t4, $t4, $t3 
		addi $t0, $t0, 1
		addi $t1, $t1, -1
		j loop4
	then:
		addi $t2, $t2, -1
		addi $t4, $t4, 10
		addi $t0, $t0, 1
		j loop4		
	endloop4:
		move $v0, $t4
		jr $ra
	
print_array:
	move $t0, $a0
	move $t1, $a1
	loop3:
		beqz $t1, endloop3
		lb $t3, ($t0) 
		move $a0, $t3
		li $v0, 11
		syscall
		addi $t0, $t0, 1
		addi $t1, $t1, -1
		j loop3
	endloop3: 
		li $a0, 32
		li $v0, 11
		syscall
		jr $ra