.data
	frase: .asciiz "ci sono esattamente cinque parole"
	
.globl main

.text

main:
	la $a0, frase
	jal conta_parole
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
conta_parole:
	move $t0, $a0
	move $t2, $zero #count
	loop:
		lb $t1, ($t0)
		beqz $t1 endloop
		addi $t0, $t0, 1
		beq $t1, 32, then
		j loop
	then:
		addi $t2, $t2, 1
		j loop
	endloop:
		move $v0, $t2
		addi $v0, $v0, 1
		jr $ra
	
	