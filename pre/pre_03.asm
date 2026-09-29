.data
input: .space 1005
stack: .space 1005
empty: .asciiz "EMPTY\n"
enter: .asciiz "\n"

.text
main:
	li $v0, 8
	la $a0, input
	li $a1, 1005
	syscall
	
	la $t0, input
	la $t1, stack
	li $t2, 0
	li $t7, 10
	li $t8, 13
	
loop:
	lbu $t3, 0($t0)
	beq $t3, $zero, done
	beq $t3, $t7, done
	beq $t3, $t8, done
	beq $t2, $zero, push
	
	addiu $t4, $t2, -1
	addu $t5, $t1, $t4
	lbu $t6, 0($t5)
	bne $t3, $t6, push
	
	addiu $t2, $t2, -1
	j next
	
push:
	addu $t5, $t1, $t2
	sb $t3, 0($t5)
	addiu $t2, $t2, 1
	
next:
	addiu $t0, $t0, 1
	j loop
	
done:
	beq $t2, $zero, printempty
	addu $t5, $t1, $t2
	sb $zero, 0($t5)
	
	li $v0, 4
	la $a0, stack
	syscall
	
	li $v0, 4
	la $a0, enter
	syscall
	
	j exit
	
printempty:
	li $v0, 4
	la $a0, empty
	syscall
	
exit:
	li $v0, 10
	syscall
	
