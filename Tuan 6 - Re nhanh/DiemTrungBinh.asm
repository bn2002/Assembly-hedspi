.data
	input: .asciiz "\nNhap diem mon hoc(Nhap -1 de ket thuc): "
	output1: .asciiz "\nDiem trung binh cua ban la: "
	output2: .asciiz "\nDiem chu cua ban la: "
	error: .asciiz "\nDiem phai > 0 "
.text
	
	li $t0, 0
	li $s1, 0
	loop:
		la $a0, input
		jal PromptInt
		move $s0, $v0
		
		beq $s0, -1, KetQua
		slti $t1, $s0, -1 
		
		beq $t1, 0, save
			save:
			add $s1, $s1, $s0
			addi $t0, $t0, 1
			b loop
			
		la $a0, error
		jal PrintString
		b loop
		
	
	
	KetQua:
	
		jal Exit

.include "utils.asm"