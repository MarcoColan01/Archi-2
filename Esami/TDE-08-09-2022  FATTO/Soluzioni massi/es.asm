.data
	MAX: 29

.globl main
.text

main:
	la $s1, MAX
	lw $s2, ($s1)
	move $a0, $s2
	jal genera_sequenza
	move $a0, $v0
	li $s0, 2
	loop3:
		beq $s0, $s2, endloop3
		move $a2, $s0
		move $a1, $s2
		jal rimuovi_multipli
		addi $s0, $s0, 1
		j loop3
	endloop3:
		move $a0, $v0
		move $a1, $s2
		jal stampa_sequenza
		li $v0, 10
		syscall
	
genera_sequenza:
	li $t2, 1
	li $v0, 9
	syscall 
	move $t0, $v0
	loop:
		beq $a0, $t2, endloop
		sw $t2, ($t0)
		addi $t2, $t2, 1
		addi $t0, $t0, 4
		j loop
	endloop:
		sw $t2, ($t0)
		jr $ra
		
stampa_sequenza:
	move $t0, $a0
	move $t1, $a1
	loop1:
		beqz $t1, endloop1
		lw $t2, ($t0)
		beqz $t2 then
		move $a0, $t2 
		li $v0, 1
		syscall
		li $a0, 32
		li $v0, 11
		syscall
		then:
			addi $t0, $t0, 4
			subi $t1, $t1, 1
			j loop1
	endloop1:
		
		jr $ra
		
rimuovi_multipli:
	move $t0, $a0 #array
	move $t1, $a1 #n
	move $t2, $a2 #k
	li $t4, 2
	loop2:
		mul $t3, $t4, $t2
		subi $t3, $t3, 1
		bge $t3, $t1 endloop2
		mul $t3, $t3, 4
		add $t3, $t3, $t0
		sw $zero, ($t3)
		addi $t4, $t4, 1
		j loop2
		
	endloop2:
		jr $ra 
	
