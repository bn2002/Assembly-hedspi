.data
	prompt: .asciiz "Nhap chuoi: "
	output: .asciiz "Ket qua: "
.text
main:
	li $a0, 1
	li $a1, 64								# Ten sinh vien toi da 63 ky tu
	jal AllocateArray
	move $s1, $v0							# dia chi cua chuoi
	
	la $a0, prompt
	jal PrintString
	# Doc chuoi
	move $a0, $s1
	li $a1, 64
	jal PromptString
	
	add $t0, $zero, $zero				# loop counter
			
count_string:
	add $t1, $t0, $s1
	lb $t1, 0($t1)
	beq $t1, '\n', sort
	beq $t1, '\0', sort
	addi $t0, $t0, 1	
	j count_string
	
sort:
	move $s3, $t0						# Do Dai Chuoi
	add $t0, $zero, $zero				# loop outer counter
	add $t1, $zero, $zero				# loop inner counter
	addi $s0, $s3, -1
	outer_loop:
										# Neu i >= 3	thoat vong lap
		
					# Lay ky tu i
		
		addi $t1, $t0, 1
		
		inner_loop:
			add $t2, $s1, $t0	
			lb 	 $t2, 0($t2)
			add $t3, $s1, $t1			# Lay ky tu j + 1
			lb 	 $t3, 0($t3)		
			##### Swap
			blt $t2, $t3, Not_Greater
			
			move $a0, $s1
			move $a1, $t0
			move $a2, $t1
			jal swap
			#####
			Not_Greater:
				addi $t1, $t1, 1
				blt $t1, $s3, inner_loop
		
		
	addi $t0, $t0, 1
	bge $t0, $s0, end_loop
	j outer_loop
		

swap:
	addi $sp, $sp, -16
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	sw $t3, 12($sp)
	add $t0, $a0, $a1
	
	add $t1, $a0, $a2
	
	lb $t2, 0($t0)			
	lb $t3, 0($t1)
	sb $t2, 0($t1)
	sb $t3, 0($t0)
	
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	lw $t3, 12($sp)
	addi $sp, $sp, 16
	jr $ra
	
end_loop:		
	la $a0, output
	jal PrintString		
	
	move $a0, $s1
	jal PrintString	
	j Exit



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
# @brief: 		Thoat chuong trinh
#-------------------------------------------------------


.text
Exit:
	li $v0, 10
	syscall
