#Utilizzando le syscall rese disponibili dall’emulatore MARS implementare un
#programma che:
#• Richieda all’utente attraverso una finestra di dialogo l’inserimento di un
#numero intero NUM
#• Estragga un numero casuale R nel range [-NUM,NUM], (il seed del generatore
#di numeri casuali può essere inizializzato con un qualsiasi numero intero)
#• Sommi R al numero inserito NUM : RESULT = NUM + R
#• Mostri all’utente attraverso una nuova finestra di dialogo il nuovo credito
#dell’utente dopo la scommessa (RESULT).

.data
	msg: .asciiz "Inserisci un numero: "
	msg2: .ascii "Nuovo credito: "
	

.text
	li $v0 4
	la $a0 msg
	syscall
	
	li $v0 5 
	syscall
	move $t0 $v0
	
	li $v0 42
	move $a0 $t0
	move $a1 $t0
	mul $a0 $a0 -1
	syscall
	move $t1 $a0
	
	add $s0 $t0 $t1
	
	li $v0 4
	la $a0 msg2
	syscall
	
	li $v0 1 
	move $a0 $s0
	syscall
	
