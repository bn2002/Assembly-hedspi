# Không thể nạp 8 vào $t0 là vì địa chỉ phải ở dạng hexa 0x1001 
# chứ không phải ở dạng số thập phân 1001

# Vả lại lui là lệnh nạp địa chỉ 0x1001 vào thanh ghi $t0 chứ không phải nạp giá trị được lưu tại địa chỉ 0x1001
.text
	lui $t0, 0x1001 
	lw $a0, 0($t0)
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

.data
	.word 8