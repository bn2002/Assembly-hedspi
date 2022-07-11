# Giai thich: ta khong the in tren cung 1 dong vi sau khi nguoi dung nhap 
# chuoi ky tu vao thi se xuat hien ky tu ket thuc xau \n
.data
input: .space 61
inputSize: .word 60
prompt: .asciiz "Nhap vao loai banh ban thich: "
output1: .asciiz "\nSo you like: "
output2: .asciiz " pie"

.text
main:
	# Prompt for the string to enter
	li $v0, 4
	la $a0, prompt
	syscall
	
	# REad the string
	li $v0, 8
	la $a0, input
	lw $a1, inputSize
	syscall
	
	# Output the text
	li $v0, 4
	la $a0, output1
	syscall
	
	# output the number
	li $v0, 4
	la $a0, input
	syscall
	
	# Output the text
	li $v0, 4
	la $a0, output2
	syscall
	
	#Exit the program
	li $v0, 10
	syscall