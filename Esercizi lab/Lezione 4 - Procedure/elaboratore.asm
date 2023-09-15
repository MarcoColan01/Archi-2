#Si scriva una procedura assembly, chiamata Elaboratore, che esegue la somma,
#differenza, moltiplicazione e divisione tra due numeri interi.
   #Input: i due operandi e un terzo parametro per la selezione dell’operazione.
   #Output: risultato (nel caso della divisione restituisce anche il resto).
#Si scriva poi il main dove:
   #• vengono chiesti all’utente operandi e operatore;
   #• il risultato dell’operazione è mostrato a terminale.
   
 .data
  	msg1: .asciiz "Inserisci il primo operando: "
  	msg2: .asciiz "Inserisci il primo operando: "
  	msg3: .asciiz "Inserisci l'operatore (1 somma 2 diff 3 prod 4 div): "
  	resto: .ascii " resto: "
  	op: .space 2
  
 .text
 .globl main
 main:
 	li $v0 4 
 	la $a0 msg1 
 	syscall
 	li $v0 5
 	syscall
 	move $s0 $v0		#s0 = operando 1
 	
 	li $v0 4 
 	la $a0 msg2 
 	syscall
 	li $v0 5
 	syscall
 	move $s1 $v0		#s1 = operando 2
 	
 	li $v0 4 
 	la $a0 msg3 
 	syscall
 	li $v0 5
 	syscall
 	move $s2 $v0		#s2 = operatore
 	
 	move $a0 $s0
 	move $a1 $s1
 	move $a2 $s2
 	jal calcolo
 	
 	move $t0 $v0
 	li $v0 1
	add $a0 $zero $t0 
 	syscall
 	j exit
 
 exit:
	li $v0, 10	# Exit
	syscall	
 	  
 	
 calcolo:
 	beq $s2 1 sum
 	beq $s2 2 subt
 	beq $s2 3 prod
 	beq $s2 4 divd
 	j fine
 	
sum:
 	add $v0 $s0 $s1
 	j fine
 	
subt:
	sub $v0 $s0 $s1
	j fine
	
prod:
	mult $s0 $s1
	mflo $v0
	j fine
	
divd:
	div $s0 $s1
	mflo $v0	#quoziente
	mfhi $v1	#resto
	j fine

fine: 
 	jr $ra
 	
 	
