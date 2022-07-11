.data
	string: .space 1000
	
	output1: .asciiz "\nNhap chuoi: "
	output2: .asciiz "\nDo dai cua chuoi la: "
.text
main:
	get_string:						# TODO
		li $v0, 54
		la $a0, output1
		la $a1, string
		la $a2, 1000
		syscall

	get_length:
		la $a0, string
		xor $s0, $zero, $zero		# s0 = length = 0
		xor $t0, $zero, $zero		# t0 = i =0
	
	check_char:
		add $t1, $a0, $t0			# t1 = a0 + t0
		
		lb $t2, 0($t1)				# t2 = string[i]
		beq $t2, 10, end_of_str		# Is \n char
		nop
		addi $s0, $s0, 1			# s0++ -> length++
		addi $t0, $t0, 1			# t0++ -> i++
		j check_char

	end_of_str:
	
	end_of_get_length:
	
	print_length:					# TODO
		li $v0, 56
		la $a0, output2
		move $a1, $s0
		syscall
		