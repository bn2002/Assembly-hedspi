#-------------------------------------------------------
# @brief: 		In ra ky tu xuong dong
#-------------------------------------------------------

.text
PrintNewLine:
	li $v0, 4
	la $a0, __PNL_newline
	syscall
	jr $ra

.data
	__PNL_newline: .asciiz "\n"

#-------------------------------------------------------
# @brief: 	In ra ky tu tab(\t)
#-------------------------------------------------------
.text 
PrintTab:
	li $v0, 4
	la $a0, __PT_tab
	syscall
	jr $ra
.data
	__PT_tab: .asciiz "\t"	


#-------------------------------------------------------
# @brief: 		In chuoi ra man hinh
# @param[in]: 	$a0 -  Dia chi cua chuoi can in

#-------------------------------------------------------

.text
PrintString:
	addi $v0, $zero, 4
	syscall
	jr $ra


#-------------------------------------------------------
# @brief: 		Nhap chuoi tu ban phim
# @param[in]: 	$a0 -  Dia chi buffer
# @param[in]: 	$a1 -  Chieu dai chuoi

#-------------------------------------------------------
.text
PromptString:

	#Read the integer value
	li $v0, 8
	syscall
	move $v0, $a0
	jr $ra

#-------------------------------------------------------
# @brief: 		In so nguyen ra man hinh
# @param[in]: 	$a0 -  Gia tri can in
#-------------------------------------------------------


.text
PrintInt:
	li $v0, 1
	syscall
	jr $ra

#-------------------------------------------------------
# @brief: 		Do dai chuoi
# @param[in]: 	$a0 -  Dia chi string
# @return: 		$v0 -  Length of string

#-------------------------------------------------------
.text
lengthString:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $t0, 4($sp)
	sw $t1, 8($sp)
	add $t0, $zero, $zero			#	counter
	lS_loop:
		add $t1, $t0, $a0
		lb	$t1, 0($t1)					# Lay ky tu
		beq $t1, '\0', lS_end
		beq $t1, '\n', lS_end
		
		addi $t0, $t0, 1
		j lS_loop
	
	lS_end:
		move $v0, $t0
		lw $ra, 0($sp)
		lw $t0, 4($sp)
		lw $t1, 8($sp)
		addi $sp, $sp, 12
		jr $ra


#-------------------------------------------------------
# @brief: 		Thoat chuong trinh
#-------------------------------------------------------

.text
Exit:
	li $v0, 10
	syscall
