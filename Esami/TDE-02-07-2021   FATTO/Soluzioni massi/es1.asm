.data
	parola: .asciiz "anna"
.globl main
	
.text

main:
	la $a0, parola
	jal palindroma
	move $a0, $v0 
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall	


palindroma:
	move $t1, $a0
	loop:
		lb $t0, ($t1)
		beqz $t0, endloop
		addi $t1, $t1, 1		
		j loop
	
	endloop:
		subi $t1, $t1, 1
		loop2:
			bge $a0, $t1 endfunct 
			lb $t0, ($t1)
			lb $t2, ($a0)
			bne $t0, $t2, then
			subi $t1, $t1, 1
			addi $a0, $a0, 1 
			j loop2
		then:
			li $v0, 0
			jr $ra 
		endfunct:
			li $v0, 1
			jr $ra