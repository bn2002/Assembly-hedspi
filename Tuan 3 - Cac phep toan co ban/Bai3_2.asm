.text
	addi $t1, $zero, 5
	addi $t2, $zero, -1
	
	add $s0, $t1, $t1
	add $s0, $s0, $t2
	
# Su thay doi cua cac thanh ghi:
	# Step 1: $t1 co gia tri la 5
	# Step 2: $t2 co gia tri la -1
	# Step 3: $s0 = $t1 + $t1 = 5 + 5 = 10
	# Step 4: $s0 = $s0 + $t2 = 10 + (-1) = 9
	
# Ket qua cua chuong trinh chinh xac
# Cac lenh lenh ma may luu dia chi cua cau lenh 