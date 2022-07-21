.data
prompt: .asciiz "Nhap chuoi ki tu : "
restart: .asciiz "Ban co muon tiep tuc khong ?"
input_length_err: .asciiz "\t[ERR]: Do dai chuoi la boi cua 8"
output1: .asciiz "      Disk 1                 Disk 2               Disk 3\n"
output2: .asciiz "----------------       ----------------       ----------------"
output3: .asciiz "|     "
output4: .asciiz "     |       "
output5: .asciiz "[[ "
output6: .asciiz "]]       "
comma: .asciiz ","
inputString: .space 130
.align 2
parity_block: .space 20
block1: .space 5
block2: .space 5

hex: .byte '0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f' 

.text
	la $s0, inputString				# Dia chi chuoi
# Yeu cau nhap chuoi
getInput:
	jal PrintNewLine
	la $a0, prompt
	jal PrintString
	
	move $a0, $s0
	li $a1, 129						# Toi da 128 Ky tu
	jal PromptString
# Kiem tra chuoi rong va do dai chuoi co chia het cho 8 hay khong
checkValidString:					
	jal lengthString
	
	move $t0, $v0					# Luu do dai cua chuoi 
	# Kiem tra xem chuoi rong hay khong
	bgt $t0, 0, CVS__isMultipleOf8
	
	# Neu khong nhap gi thi quay lai tu dau
	j getInput
	
	# Kiem tra chia het cho 8
	CVS__isMultipleOf8:
		li   $t1, 8		
		div  $t0, $t1				# Thuc hien phep chia 
		mfhi $t1					# Lay so du	
		beqz $t1, init					
	
		# Neu khong chia het cho 8
		la $a0, input_length_err
		jal PrintString
		j getInput					# Yeu cau nhap lai

################ Mo phong RAID 5 ###################

# Khoi tao 
init:
	move $s1, $t0					# $s1: do dai chuoi
	add $s5, $zero, $zero			
	
	la $a0, output1
	jal PrintString
	
	la $a0, output2
	jal PrintString
# Bat dau mo phong
start:			
beqz $s1, end						# Mỗi vòng lặp độ dài chuỗi -1, nếu length = 0 thì kết thúc vòng lặp	
addi $s5, $s5, 1					# Mỗi dòng dữ liệu có 1 cách in kết quả khác nhau
add  $t0, $zero, $zero				# loop counter

la 	 $s2, block1					
la 	 $s3, block2
la	 $s4, parity_block
jal PrintNewLine

WriteBlock1:
	lb $t1, 0($s0)
	sb $t1, 0($s2)
	addi $s1, $s1, -1
WriteBlock2:
	add $t2, $s0, 4
	lb $t2, 0($t2)
	sb $t2, 0($s3)
	addi $s1, $s1, -1
WriteParity:
	xor $t3, $t1, $t2
	sw $t3, ($s4)

	addi $s2, $s2, 1				# Phần tử tiếp theo của mảng block 1
	addi $s3, $s3, 1				# Phần tử tiếp theo của mảng block 2
	addi $s0, $s0, 1				# Ký tự tiếp theo của chuỗi 
	addi $s4, $s4, 4				# Cộng 4 để lấy block ký tự tiếp theo 
	
	addi $t0, $t0, 1				# Tăng biến đếm 
	bgt $t0, 3, finish				# Mỗi dòng sẽ có 4 lần lặp từ 0 -> 3 để xử lý  4 kí tự 
	j WriteBlock1

# Tiến hành in kết quả mô phỏng
finish:
	li $t0, '\0'
	sb $t0, ($s2)
	sb $t0, ($s3)
	addi $s0, $s0, 4
	beq $s5, 1, printLine1			# Định dạng in cho dòng 1: Block Block  Parity
	beq $s5, 2, printLine2			# Định dạng in cho dòng 2: Block Parity Block 
	beq $s5, 3, printLine3			# Định dạng in cho dòng 3: Parity Block Block 
	#j Exit
printLine1:
	jal printBlock1
	
	jal printBlock2
	
	jal printParity
	
	j start
	
	
printLine2:
	jal printBlock1
	
	jal printParity
	
	jal printBlock2
	
	j start

printLine3:
	
	jal printParity
	
	jal printBlock1
	
	jal printBlock2
	
	add $s5, $zero, $zero
	j start

printBlock1:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	la $a0, output3
	jal PrintString
	
	la $a0, block1
	jal PrintString
	
	la $a0, output4
	jal PrintString
	lw $ra, 0($sp)
	jr $ra
	
printBlock2:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, output3
	jal PrintString
	
	la $a0, block2
	jal PrintString
	
	la $a0, output4
	jal PrintString
	lw $ra, 0($sp)
	jr $ra

# In block parity				
printParity:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	addi $t0, $zero, 3				# loop counter
	la	$t1, parity_block			# Địa chỉ mảng chứa 4 phần tử của block Parity
	la $a0, output5
	jal PrintString
	
	PNI_loop:
		lw $t2, 0($t1)			   # Lấy phần tử hiện tại 
		
		# Chuyển đổi số sang hệ 16 và in 
		srl $a0, $t2, 4			   
		jal printHex
		
		move $a0, $t2			  
		jal printHex
		
		beqz $t0, PNI_next
	PNI_printComma:
		la $a0, comma
		jal PrintString
	PNI_next:	
		addi $t1, $t1, 4
		addi $t0, $t0, -1
		bge $t0, 0,  PNI_loop
	PNI_finish:
	la $a0, output6
	jal PrintString
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

# In so dang hexa
printHex: 
	addi $sp, $sp, -8
	sw $t2, 0($sp)
	sw $t3, 4($sp)
	
	la	$t3, hex
	andi $t2, $a0, 0x00000f					# Chỉ giữ lại 4 bit cuối của số được truyền vào 
	add $t2, $t3, $t2						# $t2 chinh la index cua phan tu can lay trong mang hex 
	lb $t2, ($t2)
	move $a0, $t2
	la $v0, 11
	syscall 
	
	lw $t2, 0($sp)
	lw $t3, 4($sp)
	addi $sp, $sp, 8
	jr $ra
	
end:
	jal PrintNewLine
	la $a0, output2
	jal PrintString
	
	#Chay lai tu dau
	la $a0, restart
	li $v0, 50
	syscall
	
	beqz $a0, getInput
	
	jal Exit


.include "utils.asm"
