.data
	sp: .ascii " "
.text
.globl main 
	
main:
	li $a0 4
	jal genera_sequenza
	move $s0 $v0
	move $a1 $s0 
	jal stampa_sequenza 
	li $v0 10
	syscall

stampa_sequenza:
	move $t0 $a1 
	li $t1 1
	move $t3 $a0
	
	
stampa:
	lw $t2($t0)
	beqz $t2 salta 
	move $a0 $t2
	li $v0 1
	syscall
	li $v0 4
	la $a0 sp 
	syscall
salta:
	beq $t1 $t3 torna
	addi $t1 $t1 1
	addi $t0 $t0 4
	j stampa
	
	
genera_sequenza:
	li $v0 9 
	syscall
	move $t0 $v0 
	move $t1 $t0 
	li $t2 1
	
loop:
	sw $t2($t1)
	addi $t1 $t1 4
	beq $t2 $a0 torna
	addi $t2 $t2 1
	j loop 
	
torna:
	move $v0 $t0 
	jr $ra
		
