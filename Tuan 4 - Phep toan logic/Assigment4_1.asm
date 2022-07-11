.data
	output1: .asciiz "\nGia tri cua $s0:\t"
	output2: .asciiz "\nBit MSB cua $s0:\t"
	output3: .asciiz "\n$s0 sau khi xoa LSB:\t"
	output4: .asciiz "\nThiet lap bit LSB ve 1:\t"
	output5: .asciiz "\nThuc hien xoa $s0:\t"
.text
	#Gan gia tri cho $s0
	li $s0, 0x12345678
	
	#Lay bit MSB cua $s0
	srl $t1, $s0, 24
	
	ori $v0, $zero, 4
	la $a0, output1
	syscall
	
	ori $v0, $zero, 35
	move $a0, $s0
	syscall
	
	ori $v0, $zero, 4
	la $a0, output2
	syscall
	
	ori $v0, $zero, 35
	move $a0, $t1
	syscall
	
	#Xoa bit LSB cua $s0
	srl $t1, $s0, 8
	
	ori $v0, $zero, 4
	la $a0, output3
	syscall
	
	ori $v0, $zero, 35
	move $a0, $t1
	syscall
	
	#Thiet lap bit LSB ve 1
	
	ori $v0, $zero, 4
	la $a0, output4
	syscall
	
	ori $t1, $s0, 255
	
	ori $v0, $zero, 35
	move $a0, $t1
	syscall
	
	#Xoa bit $s0
	ori $v0, $zero, 4
	la $a0, output5
	syscall
	
	andi $t1, $s0, 0
	
	ori $v0, $zero, 35
	move $a0, $t1
	syscall
	
	#Exit
	ori $v0, $zero, 10
	syscall
