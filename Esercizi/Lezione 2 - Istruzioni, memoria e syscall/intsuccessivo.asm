#Si scriva codice assembly che:
#• chieda all’utente di inserire un intero (messaggio su terminale);
#• acquisisca un intero da terminale;
#• calcoli l’intero successivo;
#• mostri all’utente il risultato (messaggio su terminale).

.data
	msg : .asciiz "Inserisci un numero: "

.text
	li $v0 4
	la $a0 msg
	syscall
	
	li $v0 5
	syscall
	move $t0 $v0
	
	addi $s0 $t0 1
	li $v0 1 
	move $a0 $s0
	syscall
