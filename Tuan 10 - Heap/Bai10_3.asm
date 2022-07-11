.text
.globl main
main:
	
	# Lay so phan tu tu ban phim
	la $a0, prompt
	jal PromptInt
	
	# Cap phat bo nho
	move $a0, $v0
	move $s1, $v0	    # s1 - so phan tu cua mang
	li $a1, 4			# so nguyen 4 byte
	jal AllocateArray
	move $s0, $v0		# s0 - luu dia chi vung nho duoc cap phat
	
	move $t0, $zero		# t0 - luu thu tu phan tu hien tai
						
get_input:
	
	la $a0, number_i
	jal PromptInt
	
	sll $t3, $t0, 2
	add $t3, $t3, $s0
	
	sw $v0, 0($t3)
	
	addi $t0, $t0, 1
	sge $t1, $t0, $s1
	beqz $t1, get_input
	 
	
	#
	move $a0, $s0
	move $a1, $s1
	jal PrintIntArray
	
	move $a0, $s0
	move $a1, $s1
	
	jal BubbleSort
	
	jal PrintNewLine
	
	move $a0, $s0
	move $a1, $s1
	jal PrintIntArray
	
	jal Exit

.data
	prompt: .asciiz "\nNhap so phan tu cua mang: "
	number_i: .asciiz "\n Nhap phan tu: "

# Subprogram: 	allocateArray
# Input: 		$a0 - the number of items in the array
#		 		$a1 - the size of each item
# Output:		$v0 - Address of the array allocated
.text
AllocateArray:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	mul $a0, $a0, $a1
	li $v0, 9
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

	
# Purpose: Sort data using a Bubble Sort algorithm
# input:	$a0 - array
#			$a1 - array size

# regiter conventopns:
# 		$s0 - array_base
# 		$s1 - array size
# 		$s2 - outer loop counter
#		$s3 - inner loop counter

.text
BubbleSort:
	addi $sp, $sp, -20
	sw $ra, 0($sp)
	sw $s0, 4($sp)	
	sw $s1, 8($sp)	
	sw $s2, 12($sp)	
	sw $s3, 16($sp)	
	
	move $s0, $a0	# dia chi mang
	move $s1, $a1	# So phan tu
	
	addi $s2, $zero, 0 	# outer loop counter  # $i

OuterLoop:
	addi $t1, $s1, -1
	slt $t0, $s2, $t1		# $s2 < $t1
	beqz $t0, EndOuterLoop
	
	addi $s3, $zero, 0		# inner loop counter # $j
	
	InnerLoop:
		addi $t1, $s1, -1
		sub $t1, $t1, $s2
		slt $t0, $s3, $t1
		beqz $t0, EndInnerLoop
		
		sll $t4, $s3, 2			# load data[j].note offset is 4 bytes
		
		add $t5, $s0, $t4
		lw $t2, 0($t5)
		
		addi $t6, $t5, 4		# load data[j+1]
		lw $t3, 0($t6)
		
		sgt $t0, $t2, $t3		# So Sanh data[j] va data[j+1]
		beqz $t0, NotGreater	# Neu t2 > t3
			move $a0, $s0
			move $a1, $s3
			addi $t0, $s3, 1
			move $a2, $t0
			jal Swap			# t5 is &data[j], t6 is &data[j+1]
		
		NotGreater:
			addi $s3, $s3, 1
			b InnerLoop
	EndInnerLoop:
		addi $s2, $s2, 1
		b OuterLoop
EndOuterLoop:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $s3, 16($sp)
	addi $sp, $sp, 20
	jr $ra

# Subprogram: Swap
# Purpose:	To swap values in an array of integers
# Input:	$a0 - the array containing elements to swap
#			$a1 - index of element 1
#			$a2 - index of element 2

Swap:
	sll $t0, $a1, 2			# calculate address of element 1
	add $t0, $a0, $t0
	sll $t1, $a2, 2			# calculate address of element 2
	add $t1, $a0, $t1
	
	lw $t2, 0($t0)			# swap element
	lw $t3, 0($t1)
	sw $t2, 0($t1)
	sw $t3, 0($t0)
	
	jr $ra


# Subprogram: PrintIntArray
# input:		$a0 - The base addrest of the array
#				$a1 - The size of the array
.text
PrintIntArray:
	addi $sp, $sp, -16		# Stack record
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	
	move $s0, $a0			# save the base of the array to $s0
	
	# inittialzation for counter loop
	# $s1: is the ending index of the loop
	# $s2: is the loop counter
	
	move $s1, $a1
	move $s2, $zero
	
	la $a0 open_bracket
	jal PrintString
	
loop:
	# check ending condition
	sge $t0, $s2, $s1
	bnez $t0, end_loop
		
		sll $t0, $s2, 2		# Mutiple the loop counter by 4 to get offset of array
		add $t0, $t0, $s0	# address of next array element
		lw $a1, 0($t0)		# Next array element
		la $a0, comma		
		jal PrintInt		# print the integer from array
		
		addi $s2, $s2, 1	# increament $s0
		b loop

end_loop:
	li $v0, 4	# print close bracket
	la $a0, close_bracket
	syscall
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	jr $ra


.data
	open_bracket: .asciiz "["
	close_bracket: .asciiz "]"
	comma: .asciiz ","


.include "utils.asm"
