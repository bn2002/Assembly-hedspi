.data
	prompt1: .asciiz "Nhap gia tri lon nhat "
	prompt2: .asciiz "Nhap gia tri ban doan "
	
	output1: .asciiz "\nGia tri ban nhap lon hon "
	output2: .asciiz "\nGia tri ban nhap nho hon "
	output3: .asciiz "\nBan nhap chinh xac "
.text
	
	# Nhap gia tri lon nhat
	li $v0, 51
	la $a0, prompt1
	syscall
	move $s0, $a0 				# max = s0
	
	# Tao so ngau nhien
	li $v0, 42
	move $a1, $s0
	syscall
	move $s1, $a0				# s1: Gia tri ngau nhien
	
	
play_game:
	li $v0, 51
	la $a0, prompt2
	syscall
	move $s2, $a0				# s2: So nguoi dung nhap
	
	 
	bgt $s2, $s1, is_greater	# Neu nguoi dung nhap lon hon
	blt $s2, $s1, is_lower		# Neu nguoi dung nhap nho hon
	beq $s2, $s1, is_equal		# Neu nguoi dung nhap dung

is_lower:
	li $v0, 55
	la $a0, output2
	syscall
	j play_game
		
is_greater:
	li $v0, 55
	la $a0, output1
	syscall
	j play_game

is_equal:
	li $v0, 55
	la $a0, output3
	li $a1, 1
	syscall
	
	j end

end:
	li $v0, 10
	syscall

	
	
	
	
	
	