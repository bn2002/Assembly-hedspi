.text
	li $s0, 0x0563 # Gan gia tri 0x0563 cho thanh ghi $s0
	andi $t0, $s0, 0xff #Thuc hien phep and: 0x0563 and 0xff
	andi $t1, $s0, 0x0400 #Thuc hien phep and: 0x0563 and 0x0400