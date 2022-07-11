
# Giải thích vấn đề 
	# Thanh ghi $ra trỏ lại địa chỉ của chính nó gây ra hiện tượng treo 


# Cơ chế cho thấy chuwong trình rơi vào vòng lặp vô tận 
	# Khi goi PrintInt: con trỏ $ra lưu địa chỉ đến câu lệnh jal Exit ở trong chương trình chính 
	# Nhưng ở trong chương trình con có lời gọi hàm jal PrintNewLine, khi chạy đến dòng này
	# con trỏ $ra sẽ lưu địa chỉ của dòng lệnh jr $ra ngay bên dưới lệnh jal PrintNewLine
	# do đó mà con trỏ $ra sẽ không còn lưu địa chỉ của câu lệnh jal Exit trong chương trình 
	# chính nữa mà trỏ lại câu lệnh jr $ra ngay sau lời gọi lệnh jal PrintNewLine 
	# => chương trình bị treo

# Giải pháp để giải quyết vấn đề này 
	# Không sử dụng lời gọi hàm con trong hàm con 
.text
main:

	la $a0, prompt
	
	jal PromptInt
	move $s0, $v0
	
	# print the value back to the user
	jal PrintNewLine
	
	la $a0, result
	#jal PrintString
	
	li $v0, 1
	move $a1, $s0
	jal PrintInt
	
	jal Exit

.data
	prompt: .asciiz "Please enter an integer: "
	result: .asciiz "You entered: "


.include "utils.asm"
