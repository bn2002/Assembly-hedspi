
.text 

	abs $s0, $s1
		sra $at, $s1, 31
		xor $s0, $at, $s1
		subu $s0, $s0, $at
	
	
	move $s0, $s1
		add $s0, $zero, $s1
	
	not $s0, $s0
		nor $s0, $s0, $zero
	
	ble $s1, $s2, ChuongTrinhCon
		slt $at, $s2, $s1
		beq $at, $zero, ChuongTrinhCon
		
ChuongTrinhCon:
	