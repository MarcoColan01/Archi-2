#Si scriva codice assembly che:
#• chieda all’utente di inserire un intero (messaggio su terminale);
#• acquisisca un intero da terminale;
#• calcoli l’intero successivo;
#• memorizzi l’intero ed il successivo in un array di dimensione 2 in memoria;
#• mostri all’utente i due numeri (messaggio su terminale).

.data
	msg: .asciiz "Inserisci un numero: "
	spc: .ascii " "
	vet: .word 0 0

.text
	li $v0 4
	la $a0 msg 
	syscall
	
	li $v0 5
	syscall
	move $t0 $v0
	
	addi $s0 $t0 1
	la $t1 vet 
	sw $t0($t1)
	sw $s0 4($t1)
	
	li $v0 1 
	move $a0 $t0 
	syscall
	
	li $v0 4
	la $a0 spc 
	syscall
	
	li $v0 1
	move $a0 $s0
	syscall
	
	