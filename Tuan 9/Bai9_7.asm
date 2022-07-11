.data
	message1: .asciiz "\nSo lon nhat la: "
	message2: .asciiz "\nTrung binh: "
.text
	
	# Khoi tao dau vao
	li $a0, 9
	li $a1, 88
	li $a2, 12
	li $a3, 16
	
# Tim so lon nhat va gia tri TB
largestAndAdverage:
	
	# Tinh tong va luu vao $t1
	add $t1, $a0, $a1
	add $t1, $t1, $a2
	add $t1, $t1, $a3
	
	jal getLarger
	add $a0, $zero, $v0
	add $a1, $zero, $a2
	
	jal getLarger
	add $a0, $zero, $v0
	add $a1, $zero, $a3
	jal getLarger
	
	add $v1, $zero, $t1
	div $v1, $v1, 4
	j exit
	

# ---------------------------------
# Ham Tim so lon nhat giua 2 so
# input:	$a0
#			$a1
# output: $v0 the largest value
getLarger:
	add $v0, $zero, $a0
	sub $t0, $v0, $a1
	bltz $t0, okay
	jr $ra 	
okay:
	add $v0, $zero, $a1
	jr $ra

exit:
	# Luu ket qua thanh ghi $v0
	add $t0, $zero, $v0
	# In ket qua
	la $a0, message1
	move $a1, $t0
	jal PrintInt
	
	
	la $a0, message2
	move $a1, $v1
	jal PrintInt
	
	j Exit
	
	

.include "utils2.asm"

