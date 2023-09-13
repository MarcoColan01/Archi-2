.data
0xABBAABBA
0x1003456

.text
li $t7 0x10010000	 #inizio del segmento .data
lw $t0($t7)
addi $t1 $t7 4
lw $10($t1)