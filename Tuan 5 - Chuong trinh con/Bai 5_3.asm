.text
main:
	
	#Print output1
	la $a0, output1
	jal PromptInt
	move $t0, $v0
	
	jal PrintNewLine
	
	#Print output2
	la $a0, output2
	jal PromptInt
	move $t1, $v0
	
	jal PrintNewLine
	
	#Print output3
	la $a0, output3
	move $a1, $t0
	jal PrintNumberInBinary
	
	jal PrintNewLine
	
	#Print output4
	la $a0, output4
	move $a1, $t1
	jal PrintNumberInBinary
	
	#Ket qua cua phep NOR
	move $a0, $t0
	move $a1, $t1
	jal NOR
	move $t2, $v0
	
	jal PrintNewLine
	
	
	la $a0, output5
	move $a1, $t2
	jal PrintNumberInBinary
	
	#Ket qua cua phep NAND
	move $a0, $t0
	move $a1, $t1
	jal NAND
	move $t2, $v0
	jal PrintNewLine
	la $a0, output6
	move $a1, $t2
	jal PrintNumberInBinary
	
	
	#Ket qua cua phep NOT
	move $a0, $t0
	jal NOT
	move $t2, $v0
	jal PrintNewLine
	la $a0, output7
	move $a1, $t2
	jal PrintNumberInBinary
	
	# Ket qua khi lay so thu nhat * 4
	jal PrintNewLine
	move $a0, $t0
	jal Mult4
	
	la   $a0, output8
	move $a1, $v0
	jal PrintInt
	
	
	
	# Ket qua khi lay so thu nhat * 10
	jal PrintNewLine
	move $a0, $t0
	jal Mult10
	
	la   $a0, output9
	move $a1, $v0
	jal PrintInt
	
	# Hoan doi 2 so
	move $a0, $t0
	move $a1, $t1
	jal HoanDoi
	
	move $t2, $a0
	move $t3, $a1
	jal PrintNewLine
	la   $a0, output10
	move $a1, $t2
	jal PrintInt
	jal PrintNewLine
	la   $a0, output11
	move $a1, $t3
	jal PrintInt
	
	# Dich vong phai 1 bit
	jal PrintNewLine
	move $a0, $t0
	
	jal RightCircularShift
	
	
	la $a0, output12
	move $a1, $v0
	
	jal PrintNumberInBinary
	
	
	jal Exit

.data
	output1: .asciiz "Nhap so thu nhat: "
	output2: .asciiz "Nhap so thu hai: "
	output3: .asciiz "So thu nhat o binary:\t\t\t"  
	output4: .asciiz "So thu hai o binary:\t\t\t"  
	output5: .asciiz "Ket qua phep NOR:\t\t\t"  
	output6: .asciiz "Ket qua phep NAND:\t\t\t"  
	output7: .asciiz "Ket qua phep NOT so thu nhat:\t\t"  
	output8: .asciiz "Ket qua khi so thu nhat * 4:\t\t"  
	output9: .asciiz "Ket qua khi so thu nhat * 10:\t\t"  
	output10: .asciiz "So thu 1 khi hoan doi:\t\t\t"  
	output11: .asciiz "So thu 2 khi hoan doi:\t\t\t" 
	output12: .asciiz "So thu 1 khi dich vong phai 1 bit:\t" 


.include "utils.asm"
