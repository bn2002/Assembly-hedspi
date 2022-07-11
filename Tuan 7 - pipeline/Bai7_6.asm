.data
	y: .space 20
	prompt: .asciiz "\nNhap chuoi: "
.text
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 8
	la $a0, y
	li $a1, 20
	syscall
	
	
	
	get_length:
		la $a0, y
		xor $s0, $zero, $zero		# s0 = length = 0
		xor $t0, $zero, $zero		# t0 = i =0
	check_char:
		add $t1, $a0, $t0			# t1 = a0 + t0
		
		lb $t2, 0($t1)				# t2 = string[i]
		beq $t2, 10, check	# Is \n char
		nop
		addi $s0, $s0, 1			# s0++ -> length++
		addi $t0, $t0, 1			# t0++ -> i++
		j check_char
	
		
check:
		subi $s0,$s0,1
		la $s3, y	
reverse_print:
		add $t1, $s3, $s0
		li $v0, 11
		lb $a0, 0($t1)
		syscall
		beq $s0, $zero, end_of_str 
		subi $s0, $s0, 1 
		j reverse_print
		
	end_of_str:
		li $v0,10

		syscall
		
	
	
