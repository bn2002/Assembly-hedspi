.text

	addi $s0, $zero, 0x2110003d
	add $s0, $zero, $0


#Khi run step thi:
	# Thanh ghi $s0 ban dau co gia tri 0 se duoc set la 0x3007(co gia tri la 12295 o he co so 10)
		# thanh ghi PC dung de dem so lenh duoc thuc thi, ban dau la 0x00400000 sau khi chay 1 lenh se thanh 0x00400004
	# Bam next 1 lan nua thi thanh ghi $s0 se duoc set ve 0 ($s0 = $0 + $0), thanh ghi pc se dich them 4 bit va co gia tri la: 0x0040000
	
# Khi sua lenh lui
	# Do so 0x2110003d lon hon 16bit nen se duoc chuyen thanh 2 lenh la lui va ori
	# sau do tien hanh cong nhu binh thuong
	# o day co tat ca 4 lenh len thanh ghi pc sau khi chay truong trinh co gia tri la 0x00400010