.data
	empty_string: .asciiz ""
	prompt_number_student: .asciiz "Nhap so sinh vien: "
	prompt_info_of_student: .asciiz "Nhap thong tin cho sinh vien thu "
	prompt_name_of_student: .asciiz "\n\tNhap ten sinh vien: "
	prompt_mark_of_student: .asciiz "\tNhap diem cua sinh vien: "
	
	output_name_of_student: .asciiz "\nTen: "
	output_table_title: .asciiz "\n Bang Diem Sau Khi Sap Xep\n"
	output_table_index: .asciiz "\n\tSTT\t"
	output_table_name: .asciiz "Ho Ten\t\t\t\t\t"
	output_table_mark: .asciiz "Diem \n"
	output_table_boder: .asciiz "------------------------------------------------------------------------\n"		

.text

# Doc so sinh vien
read_number_student:
	
	li $a1, 1								# min: 1  SV
	li $a2, 50								# max: 50 SV
	la $a3, prompt_number_student
	jal promptValidNumber
	move $s0, $v0
	
	
	
	# Cap phat bo nho luu ten sinh vien
	move $a0, $s0
	li $a1, 64								# Ten sinh vien toi da 63 ky tu
	jal AllocateArray
	move $s1, $v0
	
	# Cap phat bo nho luu diem sinh vien
	move $a0, $s0							# So phan tu cua mang
	li $a1, 4								# So nguyen 4 byte
	jal AllocateArray
	move $s2, $v0
	
	# Cap phat bo nho vi tri cua sinh vien sau khi sap xep
	move $a0, $s0
	li $a1, 4							
	jal AllocateArray
	move $s3, $v0
	
	move $a0, $s3
	move $a1, $s0
	
	# Tao mang gia tri tang dan
	jal CreateIncreaseNumber
	
# Lay ho ten va diem sinh vien
	add $t0, $zero, $zero					# Khoi tao bien dem i
read_info_of_student:
	addi $t1, $t0, 1
	la $a0, prompt_info_of_student 
	move $a1, $t1
	jal PrintInt
	# Doc ten cua sinh vien
	read_name_of_student:
		la $a0, prompt_name_of_student
		jal PrintString
		
		
		# Lay dia chi de luu ten sinh vien
		mul $t1, $t0, 64
		add $t1, $s1, $t1
		
		# Doc ten
		move $a0, $t1
		li $a1, 64
		jal PromptString
		
		# Kiem tra ten
		lb $t2, ($v0)
		sne $t2, $t2, 10 						# Kiem tra xem chuoi rong khong 
												# bang viec so khop ky tu dau (10 la ky tu \n)
		beqz $t2, read_name_of_student			# Neu nguoi dung khong nhap ten thi yeu cau nhap lai
		
		move $a0, $t1
		jal RemoveNewline						# Xoa ky tu \n khi nhap tu ban phim
		
	# Doc diem cua sinh vien	
	read_mark_of_student:
		
		li $a1, 0								# min: 0  diem
		li $a2, 10								# max: 10 diem
		la $a3, prompt_mark_of_student
		jal promptValidNumber
		move $t1, $v0

		# Luu diem neu hop le
		mul $t2, $t0, 4
		add $t2, $s2, $t2
		
		sw $t1, 0($t2)

	# Nhap thong tin cho sinh vien tiep theo
	addi $t0, $t0, 1
	blt $t0, $s0, read_info_of_student
	
	move $a0, $s2
	move $a1, $s0
	
	move $a3, $s3
	
	jal BubbleSort								# Sap xep mang	
	
	jal PrintNewLine
	
	move $a0, $s2
	move $a1, $s0
	move $a2, $s1
	move $a3, $s3
	jal PrintStudent							# In danh sach sinh vien sau khi sap xep
	
	j Exit

#-------------------------------------------------------
# @brief: 		In danh sach sinh vien va diem
# @param[in]:	$a0 - Dia chi mang luu diem sinh vien
# @param[in]:	$a1 - So luong sinh vien
# @param[in]:	$a2 - Dia chi mang luu ten sinh vien
# @param[in]:	$a3 - Dia chi mang luu thu tu sinh vien sau khi sap xep
# $output	: 	Danh sach sinh vien kem diem so
#-------------------------------------------------------
.text
PrintStudent:
	# Stack record
	addi $sp, $sp, -20		
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	sw $s3, 16($sp)
	sw $s4, 20($sp)
	
	move $s0, $a0		
	move $s3, $a2		
	move $s4, $a3
	
	# Khoi tao vong lap
	move $s1, $a1							# $s1: is the ending index of the loop
	move $s2, $zero							# $s2: is the loop counter
	
	
	
	la $a0, output_table_title
	jal PrintString
	
	la $a0, output_table_index
	jal PrintString
	
	la $a0, output_table_name
	jal PrintString
	
	la $a0, output_table_mark
	jal PrintString
	
	la $a0, output_table_boder
	jal PrintString
	
loop:
	# check ending condition
	sge $t0, $s2, $s1
	bnez $t0, end_loop
		#la $a0, output_name_of_student
		#jal PrintString
		
		# In STT
		jal PrintTab
		addi $t2, $s2, 1
		la $a0, empty_string
		move $a1, $t2
		jal PrintInt
		
		jal PrintTab
		sll $t0, $s2, 2	
		add $t0, $t0, $s4
		lw  $t1, 0($t0)
		
		# In Ten
		sll $t0, $t1, 6
		add $t0, $t0, $s3
		move $a0, $t0
		jal PrintString
		
		jal PrintTab
		jal PrintTab
		jal PrintTab
		jal PrintTab
		
		# In Diem
		sll $t0, $s2, 2							# Mutiple the loop counter by 4 to get offset of array
		add $t0, $t0, $s0						# address of next array element
		lw $a1, 0($t0)							# Next array element
		la $a0, empty_string	
		jal PrintInt							# print the integer from array
		
		#la $a0, comma
		jal PrintNewLine

		
		addi $s2, $s2, 1						# increase $s0
		b loop

end_loop:
	
	
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	addi $sp, $sp, 20
	jr $ra

		
.include "utils.asm"
