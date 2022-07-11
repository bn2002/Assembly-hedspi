.text
	# Assign X, Y
	addi $t1, $zero, 4
	addi $t2, $zero, 5
	mul $s0, $t1, $t2
	mul $s0, $s0, 3
	#Z' = Z
	mflo $s1
	
# Ket qua cua phep toan chinh xac
# Diem bat thuong la: mul $s0, $s0, 3 Do mul thuc hien phep nhan co 3 thanh ghi 
	# Ma ta lai su dung gia tri tuc thoi la 3 nen no se truyen ve thuc hien hien 1 phep cong roi moi tien hanh thuc hien phep nhan
	