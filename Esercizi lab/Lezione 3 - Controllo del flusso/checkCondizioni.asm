#Si scriva il codice assembly che esegua le seguenti istruzioni:
#a = <intero inserito dall’utente>
#b = <intero inserito dall’utente>
#c = <intero inserito dall’utente>
#If ( (a>=b) && (c!=0) ){
#z=c(a+b);
#print z
#}
#else{
#print «errore»
#}

.data
	msgA: .asciiz "Inserisci a: "
	msgB: .asciiz "Inserisci b: "
	msgC: .asciiz "Inserisci c: "
	err: .asciiz "Errore"
	
.text
	li $v0 4
	la $a0 msgA 
	syscall
	li $v0 5
	syscall 
	move $t0 $v0
	
	li $v0 4
	la $a0 msgB 
	syscall
	li $v0 5
	syscall 
	move $t1 $v0
	
	li $v0 4
	la $a0 msgC 
	syscall
	li $v0 5
	syscall 
	move $t2 $v0
	
	bge $t0 $t1 check2
	j errore

check2:
	bnez $t2 ok
	j errore
ok:	
	add $s0 $t0 $t1
	mult $s0 $t2
	mflo $a0
	li $v0 1
	syscall
	j fine
errore:
	li $v0 4
	la $a0 err 
	syscall
	j fine
fine:
	
	
	