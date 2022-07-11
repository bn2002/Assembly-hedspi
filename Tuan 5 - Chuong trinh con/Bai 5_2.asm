# vấn đề ở đây là trình biên dịch đang hiểu nhầm PrintTab là một khối lệnh trong .data 
# của PrintNewLine chứ không phải là 1 chương trình con 

# để giải quyết vấn đề này ta thêm .text ngay trước phần khai báo chương trình con  PrintTab


.text
main:

	la $a0, output1
	
	# print output 1
	jal PrintString
	
	# print the value back to the user
	jal PrintNewLine
	
	# print tab
	jal PrintTab
	
	# print output2
	
	la $a0, output2
	jal PrintString 
	
	jal Exit

.data
	output1: .asciiz "Dong thu nhat"
	output2: .asciiz "Dong thu hai"

.include "utils.asm"