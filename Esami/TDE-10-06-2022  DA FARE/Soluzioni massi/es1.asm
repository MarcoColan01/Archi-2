.data 
	s1: .asciiz "Provasonouguale"
	s2: .asciiz "provasonouguale"

.globl main
.text

main:
	
	la $a0, s1
	la $a1, s2
	jal comparaStr
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall

comparaStr:
	move $t0, $a0
	move $t1, $a1
	loop:
		lb $t2, ($t0)
		lb $t3, ($t1)
		bne $t2, $t3 then
		beqz $t2 endloop
		beqz $t3 endloop
		addi $t0, $t0, 1
		addi $t1, $t1, 1
		j loop
		then:
			move $v0, $zero
			jr $ra
	endloop:
		li $v0, 1
		jr $ra