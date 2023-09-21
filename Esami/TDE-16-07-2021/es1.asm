.data
	array: 2 5 3 9 8 4
	
.globl main

.text

main:
	la $a0, array
	li $a1, 5
	li $a2, 10
	jal copian
	li $v0, 10
	syscall
	
copian:
	move $t0, $a0 #indirizzo array
	move $t1, $a1 #lunghezza array
	move $t2, $a2 #valori da copiare
	move $t3, $zero #count
	move $t4, $a0 #indirizzo nuovo array
	loop:
		beq $t1, $t3 endloop
		addi $t3, $t3, 1
		addi $t4, $t4, 4
		j loop
	endloop:
		addi $t4, $t4, 4
		move $v0, $t4 
		move $t3, $zero
		sub $t5, $t1, $t2
		blez $t5 then
		j loop2
		then:
			move $t2, $t1
			addi $t2, $t2, 1
		loop2:
			beq $t3, $t2 endloop2
			lw $t6, ($t0)
			sw $t6, ($t4)
			addi $t3, $t3, 1
			addi $t0, $t0, 4
			addi $t4, $t4, 4
			j loop2
	 
		endloop2:
			jr $ra