.data 
	array: 8 7 2 3 5 1
	
.globl main

.text

main:
	la $a0, array
	li $a1, 6
	jal max_min
	move $a0, $v0
	li $v0, 1
	syscall
	move $a0, $v1
	syscall
	li $v0, 10
	syscall
	
max_min:
	move $t0, $a0
	move $t1, $a1
	move $t3, $zero #max
	li $t4, 10000 #min
	loop:
		blez $t1, endloop
		lw $t2, ($t0)
		ble $t3, $t2, max
		bge $t4, $t2, min
		addi $t0, $t0, 4
		subi $t1, $t1, 1
		j loop
		max:
			move $t3, $t2
			addi $t0, $t0, 4
			subi $t1, $t1, 1
			j loop
		min: 
			move $t4, $t2
			addi $t0, $t0, 4
			subi $t1, $t1, 1
			j loop 	
		
	endloop: 
		move $v0, $t3
		move $v1, $t4
		jr $ra
		