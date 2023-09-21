.data
	parola1: .asciiz "ciao"
	parola2: .asciiz "ciao "
	yes: .asciiz "Uguali"
	no: .asciiz "NON uguali"
	
.text
	la $a0 parola1 
	la $a1 parola2 
	jal comparaStr
	beqz $v0 false 
	li $v0 4
	la $a0 yes 
	syscall
	j fine

false:
	li $v0 4
	la $a0 no 
	syscall 
	j fine
	
fine:
	li $v0 10
	syscall
	
comparaStr:
	
loop:
	lb $t0($a0)
	lb $t1($a1) 
	beqz $t0 end
	beqz $t1 end
	bne $t0 $t1 end
	addi $a0 $a0 1
	addi $a1 $a1 1
	j loop

end:
	beq $t0 $t1 ritorna1
	li $v0 0
	jr $ra
	
ritorna1:
	li $v0 1
	jr $ra