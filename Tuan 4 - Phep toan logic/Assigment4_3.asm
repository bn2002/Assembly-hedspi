.data
input: .asciiz "So mu cua 2: "
output: .asciiz "Ket qua = "
.text
# Nhập số mũ của 2
	ori $v0, $zero, 4
	la $a0,input
	syscall
	
	ori $v0, $zero, 5
	syscall
	move $s0, $v0
	subi $s0,$s0,1
# Thực hiện tính và in kết quả
	ori $v0, $zero, 4
	la $a0,output
	syscall
	
	ori $v0, $zero, 1
	
	ori $s1,0x00000002
	
	sllv $a0, $s1, $s0
	
	syscall
# end
	ori $v0, $zero, 10
	syscall
	
