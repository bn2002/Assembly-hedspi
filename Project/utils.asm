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
# @brief: 		In so nguyen ra man hinh
# @param[in]: 	$a0 -  The address of the string to the console
# @param[in]: 	$a1 -  The value of the int to print

#-------------------------------------------------------


.text
PrintInt:
	addi $v0, $zero, 4
	syscall
	move $a0, $a1
	li $v0, 1
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
# @brief: 		Nhap so tu ban phim
# @param[in]: 	$a0 -  The address of the string to the console
# @param[in]: 	$a1 -  Chieu dai chuoi
# @return: 		$v0 - The value the user entered
#-------------------------------------------------------


.text
PromptInt:
	# Print the prompt, which is already in $a0
	li $v0, 4
	syscall
	
	#Read the integer value
	li $v0, 5
	syscall
	jr $ra

#-------------------------------------------------------
# @brief: 		Tao mang n phan tu, moi phan tu m byte
# @param[in]: 	$a0 - the number of items in the array
# @param[in]: 	$a1 - the size of each item
# @return: 		$v0 - Address of the array allocated
#-------------------------------------------------------

.text
AllocateArray:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	mul $a0, $a0, $a1
	li $v0, 9
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

#-------------------------------------------------------
# @brief: 		Sap xep noi bot
# @param[in]: 	$a0 - Mang can sap xep
# @param[in]: 	$a1 - Kich thuoc cua mang
# @param[in]: 	$a3 - Mang chua luu thu tu phan tu sau khi duoc sap xep
#-------------------------------------------------------


.text
BubbleSort:
	addi $sp, $sp, -20
	sw $ra, 0($sp)
	sw $s0, 4($sp)	
	sw $s1, 8($sp)	
	sw $s2, 12($sp)	
	sw $s3, 16($sp)	
	
	move $s0, $a0						# dia chi mang
	move $s1, $a1						# So phan tu
	
	addi $s2, $zero, 0 					# outer loop counter  # $i

OuterLoop:
	addi $t1, $s1, -1
	slt $t0, $s2, $t1					# $s2 < $t1
	beqz $t0, EndOuterLoop
	
	addi $s3, $zero, 0					# inner loop counter # $j
	
	InnerLoop:
		addi $t1, $s1, -1
		sub $t1, $t1, $s2
		slt $t0, $s3, $t1
		beqz $t0, EndInnerLoop
		
		sll $t4, $s3, 2					# load data[j].note offset is 4 bytes
		
		add $t5, $s0, $t4
		lw $t2, 0($t5)
		
		addi $t6, $t5, 4				# load data[j+1]
		lw $t3, 0($t6)
		
		sgt $t0, $t2, $t3				# So Sanh data[j] va data[j+1]
		beqz $t0, NotGreater			# Neu t2 > t3
			move $a0, $s0
			move $a1, $s3
			addi $t0, $s3, 1
			move $a2, $t0

			jal Swap		
			
			move $a0, $a3
			jal Swap
			
		
		NotGreater:
			addi $s3, $s3, 1
			b InnerLoop
	EndInnerLoop:
		addi $s2, $s2, 1
		b OuterLoop
EndOuterLoop:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $s3, 16($sp)
	addi $sp, $sp, 20
	jr $ra

#-------------------------------------------------------
# @brief: 		To swap values in an array of integers
# @param[in]: 	$a0 - the array containing elements to swap
# @param[in]: 	$a1 - index of element 1
# @param[in]: 	$a2 - index of element 2
#-------------------------------------------------------

Swap:
	addi $sp, $sp, -4
	sw $t0, 0($sp)

	sll $t0, $a1, 2			# calculate address of element 1
	add $t0, $a0, $t0
	sll $t1, $a2, 2			# calculate address of element 2
	add $t1, $a0, $t1
	
	lw $t2, 0($t0)			# swap element
	lw $t3, 0($t1)
	sw $t2, 0($t1)
	sw $t3, 0($t0)
	
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	jr $ra

#-------------------------------------------------------
# @brief: 		Xoa ky tu xuong dong
# @param[in]: 	$a0: dia chi cua chuoi can xoa ky tu \n
#-------------------------------------------------------

.text
RemoveNewline:
	addi $sp, $sp, -16
	sw $ra, 0($sp)
	sw $t0, 4($sp)
 	sw $t1, 8($sp)
	sw $t2, 12($sp)
	
	RNL_loop:
		add $t1, $a0, $t0
		lb $t2, 0($t1)
		beq $t2, '\n', RNL_replace
		beq $t2, '\0', RNL_exit
		addi $t0, $t0, 1
		
		j RNL_loop
	RNL_replace:
		sb $0, 0($t1)
	RNL_exit:	
		lw $ra, 0($sp)
		lw $t0, 4($sp)
 		lw $t1, 8($sp)
		lw $t2, 12($sp)
		addi $sp, $sp, 16
		jr $ra
		
#-------------------------------------------------------
# @brief: 		Tao mang chua so nguyen tang dan tu 0 den n - 1
# @param[in]:	$a0 - Dia chi cua mang
# @param[in]:	$a1 - So nguyen n
#-------------------------------------------------------
.text
CreateIncreaseNumber:
 	addi $sp, $sp, -16
 	sw $s0, 0($sp)
 	sw $s1, 4($sp)
	sw $s2, 8($sp)
	add $s0, $zero, $zero
  	IncreaseLoop:
  		sll $s1, $s0, 2
  		add $s1, $a0, $s1
  		sw $s0, 0($s1)
  		
  		addi $s0, $s0, 1
  		ble $s0, $a1, IncreaseLoop

	
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	addi $sp, $sp, 16
	jr $ra


#-------------------------------------------------------
# @brief: 		Yeu cau nguoi dung nhap 1 so trong khoang tu min den max
# @param[in]:	$a1 - min
# @param[in]:	$a2 - max
# @param[in]:	$a3 - Dia chi string khi nguoi dung nhap 
#-------------------------------------------------------
.text 
promptValidNumber:
	
	addi $sp, $sp, -40
	sw $ra, 0($sp)
	sw $s0, 4($sp)	
	sw $s1, 8($sp)	
	sw $s2, 12($sp)	
	sw $t0, 28($sp)
	sw $t1, 32($sp)
	sw $t2, 36($sp)
	sw $t3, 40($sp)
	
	#move $s0, $a0
	move $s1, $a1
	move $s2, $a2 
	
	li $a0, 1							# Mang 1 phan tu
	li $a1, 4							# 4 byte
	jal AllocateArray
	move $s0, $v0
  PVN_getInput:
  		move $a0, $a3
  		jal PrintString
  		
  		move $a0, $s0
		li $a1, 5						# Nhap toi da 4 ky tu
		li $v0, 8
		syscall
	add  $t0, $zero, $zero				# t0: bien dem
	add  $t2, $zero, $zero				# So doc duoc tu ban phim
  PVN_loop:
  	add $t1, $s0, $t0
  	lb $t1, 0($t1)
  	
  	beq $t1, '\n', PVN_endLoop			# Ky tu ket thuc
  	beq $t1, '\0', PVN_endLoop			# Ky tu ket thuc
  	
  	blt $t1, 48, PVN_invalid
  	bgt $t1, 57, PVN_invalid
  	
  	andi $t1,$t1,0x0F
  	
  	# Check overflow
  	mul $t2, $t2, 10
  	addu $t2, $t2, $t1
  	sgt  $t3, $t2, 0xffffffff 
  	beqz $t3, PVN_overflow 
  	
  	blt $t2, $s1, PVN_rangeError
  	bgt $t2, $s2, PVN_rangeError
  	
  	
  	addi $t0, $t0, 1
  	j PVN_loop
  
  PVN_invalid:
  	la $a0, InvalidInputMessage
  	jal PrintString
  	j PVN_getInput
  PVN_rangeError:
 	
  	la $a0, RangeNumberError_1
  	move $a1, $s1
  	jal PrintInt
  	
  	la $a0, RangeNumberError_2
  	move $a1, $s2
  	jal PrintInt
  	
	jal PrintNewLine
  	j PVN_getInput	
  PVN_overflow:
  	li $v0, 4
  	la $a0,  PVN_overlow
  	syscall
  	
  PVN_endLoop:
  	beqz $t0,  PVN_getInput
	move $v0, $t2
  PVN_exit:	
  	lw $ra, 0($sp)
	lw $s0, 4($sp)	
	lw $s1, 8($sp)	
	lw $s2, 12($sp)	
	lw $t0, 28($sp)
	lw $t1, 32($sp)
	lw $t2, 36($sp)
	lw $t3, 40($sp)
	addi $sp, $sp, 40
	
  	jr $ra	
  	
.data
	InvalidInputMessage: .asciiz "\nBan nhap khong dung dinh dang, hay nhap so \n" 
	RangeNumberError_1: .asciiz "\nSo ban nhap phai trong khoang tu "
	RangeNumberError_2: .asciiz " den "
	PVN_overlow: .asciiz "Gia tri ban nhap vao qua lon\n"

#-------------------------------------------------------
# @brief: 		Thoat chuong trinh
#-------------------------------------------------------


.text
Exit:
	li $v0, 10
	syscall
