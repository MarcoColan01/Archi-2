.data 
	A: 12 5 10 31 9
	n: 5
.globl main
.text

main:
	li $s0, 1000 #min
	la $s1, A
	la $t0, n
	lw $s2, ($t0) #n elementi
	li $a1, 2
	loop1:
		beqz $s2, endloop1
		lw $s3, ($s1)
		move $a0, $s3
		jal min_potenza
		sub $s5, $v0, $s3 
		bge $s0, $s5 then1
		addi $s1, $s1, 4
		addi $s2, $s2, -1
		j loop1
	then1:
		move $s0, $s5
		move $s6, $s3
		addi $s1, $s1, 4
		addi $s2, $s2, -1
		j loop1
	endloop1:
		li $v0, 1
		move $a0, $s6
		syscall
		li $v0, 10
		syscall

min_potenza:
	move $t0, $a0  #x
	move $t1, $a1  #b
	move $t2, $a1
	loop:
		bge $t1, $t0, endloop
		mul $t1, $t1, $t2
		j loop
	endloop:
		move $v0, $t1
		jr $ra
		
	
	