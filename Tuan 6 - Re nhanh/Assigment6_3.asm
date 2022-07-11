.data
	myArray: .word 1, 2, 3, 4, 5
	output: .asciiz "\nSum of array: "
.text
	initValue:
		li $s1, 0
		li $s3, 5
		li $s4, 1
		li $s5, 0
		la $s2, myArray
		
	loop:
		add $t1, $s1, $s1 # t1 = 2 * s1
		add $t1, $t1, $t1 # t1 = 4 * s1
		add $t1, $t1, $s2 # t1 store the address of A[i]
		lw $t0, 0($t1) # load value of A[i] in $t0
		add $s5, $s5, $t0 # sum = sum + A[i]
		add $s1, $s1, $s4 # i = i + step
		bne $s1, $s3, loop # if i != n, goto loop
		# Dieu kien i < n: blt $s1, $s3, loop
		# Dieu kien i <=n: ble $s1, $s3, loop
		# Dieu kien sum >= 0: bgez $s5, loop
		# Dieu kien A[i] == 0: beqz $t0, loop
		
		jal Exit
.include "utils.asm"
