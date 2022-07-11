.data
	string: .space 1000
	y: .space 1000
	
	output1: .asciiz "\nNhap chuoi: "
	output2: .asciiz "\nDo dai cua chuoi la: "
	output3: .asciiz "\nChuoi copy: "
.text
main:
	get_string:						# TODO
		li $v0, 4
		la $a0, output1
		syscall
		
		li $v0, 8
		la $a0, string
		li $a1, 999				   	# Doc toi da 999 ky tu
		
		syscall
		
	get_length:
		la $a0, string
		la $a1, y
		xor $s0, $zero, $zero		# s0 = length = 0
		xor $t0, $zero, $zero		# t0 = i =0
	
	check_char:
		add $t1, $a0, $t0			# t1 = a0 + t0
		
		lb $t2, 0($t1)				# t2 = string[i]
		add $t3, $s0, $a1 			# t3 = s0 + a0 = i + y[0]
		sb $t2, 0($t3)
		beq $t2, 10, end_of_str	# Is null char
		nop
		addi $s0, $s0, 1			# s0++ -> length++
		addi $t0, $t0, 1			# t0++ -> i++
		j check_char

	end_of_str:
	
	end_of_get_length:
	
	print_length:					# TODO
		li $v0, 4
		la $a0, output2
		syscall
		
		li $v0, 1
		move $a0, $s0
		syscall
		
		
		li $v0, 4
		la $a0, output3
		syscall
		
		li $v0, 4
		la $a0, y
		syscall
		