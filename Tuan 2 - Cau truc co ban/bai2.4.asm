.text
    	li $a1, 99  #gan gia tri lon nhat vao thanh ghi $a1
    	li $v0, 42  #Goi dich vu tao so ngau nhien
    	syscall
    	
    	add $a0, $a0, 1  #Cong 1 vao so ngau nhien de dam bao so do luon > 0
    	
    	li $v0, 1   #In so ngau nhien
    	syscall
    
    	li $v0, 10
	syscall