.data 
X: .asciiz "\Nhap X = "
Y: .asciiz "\Nhap Y = "
Z: .asciiz "\Nhap Z = "
KetQuaA: .asciiz "\n5X + 3Y + Z = "
KetQuaB: .asciiz "\n((5x + 3y + z) / 2) * 3 = "
KetQuaC: .asciiz "\nx^3+2x^2 +3x+4 = "
KetQuaD: .asciiz "\n(4x / 3) * y = "

.text
	# Nhap x
	li $v0,4
	la $a0,X
	syscall
	li $v0,5
	syscall
	move $s0,$v0
	
	# Nhap y
	li $v0,4
	la $a0,Y
	syscall
	li $v0,5
	syscall
	move $s1,$v0
	
	# Nhap z
	li $v0,4
	la $a0,Z
	syscall
	li $v0,5
	syscall
	move $s2,$v0
# y =  5x + 4y + z
	li $v0,4
	la $a0,KetQuaA
	syscall
	
	li $v0,1
	mul $s3,$s0,5
	mul $t0,$s1,3
	add $s3,$s3,$t0
	add $s3,$s3,$s2
	move $a0,$s3
	syscall
	
# y = ((5x + 3y + z) / 2) * 3
	li $v0,4
	la $a0,KetQuaB
	syscall
	
	li $v0,1
	mul $s4,$s3,3
	div $s4,$s4,2
	mfhi $t0
	move $a0,$s4
	syscall
	
# y =  x^3+2x^2 +3x+4
	li $v0,4
	la $a0,KetQuaC
	syscall
	mul $t0,$s0,$s0
	mul $t1,$t0,$s0
	mul $t0,$t0,2
	add $t0,$t0,$t1
	mul $t1,$s0,3
	add $t0,$t0,$t1
	addi $s5,$t0,4
	
	li $v0,1
	move $a0,$s5
	syscall
# y =  (4x / 3) * y
	li $v0,4
	la $a0,KetQuaD
	syscall
	
	mul $t0,$s0,4
	div $t0,$t0,3
	mul $s6,$t0,$s1
	li $v0,1
	move $a0,$s6
	syscall
	
# Exit
	li $v0,10
	syscall