.data
	message1: .asciiz "\nNhap so thu nhat: "
	message2: .asciiz "\nNhap so thu hai: "
	message3: .asciiz "\nNhap so thu ba: "
	message4: .asciiz "\nTrung binh 3 so: "
.text
	jal app
	la $a0, message4
	move $a1, $v0
	jal PrintInt
	
	j Exit

app:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, message1
	jal PromptInt
	move $t0, $v0
	
	add $t3, $zero, $t0
	
	la $a0, message2
	jal PromptInt
	move $t1, $v0
	
	add $t3, $t3, $t1
	
	la $a0, message3
	jal PromptInt
	move $t2, $v0
	
	add $t3, $t3, $t2
	
	div $v0, $t3, 3
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
.include "utils.asm"