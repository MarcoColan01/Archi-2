.data 
	ins: .asciiz "Inserisci una parola: " 
	yes: .asciiz "Palindroma"
	no: .asciiz "NON palindroma"
	parola: .asciiz "kayak"
	
.text
.globl main 

main: 
	
	la $a0 parola
	
	
	jal check 
	beq $v0 1 ok 
	
	li $v0 4 
	la $a0 no
	syscall
	j termina 
	
ok:
	li $v0 4
	la $a0 yes
	syscall
	j termina
	
termina:
	li $v0 10 
	syscall

	
	
check:
	move $t1 $a0 
	
len:
	lb $t0($t1)
	beqz $t0 endLen 
	addi $t1 $t1 1 		#t0 = fine parola
	j len
	
endLen:
	subi $t1 $t1 1 
loop:
	bge $a0 $t1 fine 
	lb $t0($t1)
	lb $t2($a0)
	bne $t0 $t2 false 
	subi $t1 $t1 1
	addi $a0 $a0 1
	j loop
	
false:
	li $v0 0 
	jr $ra
fine:
	li $v0 1
	jr $ra
	