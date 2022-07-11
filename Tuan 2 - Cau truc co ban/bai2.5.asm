.data
output: .asciiz "DOi thoat sau 4s "

.text
	li $a0, 4000  #gan gia tri lon nhat vao thanh ghi $a1
	li $v0, 32
	syscall
	
	li $v0, 10
	syscall