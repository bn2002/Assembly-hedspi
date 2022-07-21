# chuong trinh kiem tra chuoi doi xung 
.data 
       
       maxsize: .word 80
       chuoi: .space 100
       nhapchuoi: .asciiz "hay nhap chuoi can kiem tra : "
       doi_xung: .asciiz "chuoi da cho doi xung ! "
       ko_dx: .asciiz "chuoi da cho khong doi xung !"
.text
  main: 
        li $v0 , 4     # loi nhac in ra chuoi 
        la $a0 , nhapchuoi
        syscall
        
        # nhap vao chuoi
        lw $a1 , maxsize
        la $a0 , chuoi 
        li $v0 , 8
        syscall
        
        # in ra chuoi vua nhap 
        
        la $a0 , chuoi
        li $v0 , 4
        syscall
        
        la $a0 , chuoi 
        
        jal count 
        
        addi $v0 , $v0 , -1        # count = v0 
        
        # move $a0 , $v0              # in ra count 
        # li $v0 , 1
        # syscall
        
        la $a0 , chuoi            # luu dia chi khi vao chuong trinh con
        move $a1 , $v0            # luu gia tri count 
        
        jal check_dx
        beq $v0 , 1, la_doi_xung 
        la $a0 , ko_dx
        li $v0 , 4
        syscall
        
        j exit  
           
        la_doi_xung: 
                la $a0 , doi_xung
                li $v0 , 4 
                syscall
        
        # exit 
        exit : li $v0 , 10 
               syscall
        
        
        # chuong trinh kiem tra 
# chuong trinh dem so ki tu trong chuoi 

.text 
        
count: 
        li $s0 , 0    # i = 0
        loop:
        add $a1 , $s0 , $a0        # a1 = a[i] 
        lb $a2 , 0($a1)
        beq $a2 , $0 , endloop
        addi $s0 , $s0 , 1        # i = i + 1 
        j loop 
        
        
        endloop:
        move $v0 , $s0 
        jr $ra 
        
.text 
check_dx: 
        li $s0 , 0      # i = 0 
        move $s1 , $a1
        addi $s1 , $s1 , -1     # j = count - 1 
        
        li $s6 , 1                   # s6 = 1 => dieu kien kiem tra dang dung 
        loop_check: 
              add $t0 , $s0 , $a0   
              lb $t0 , 0($t0)            # t0 = a[i]
              
              add $t1 , $s1 , $a0   
              lb $t1 , 0($t1)            # t1 = a[j] 
              
              sle $s2 , $s0 , $s1       # s2 = 1 neu i <= j
              beqz $s2 , end_loop_check   # ij i <= j thi vao vong lap
              
              bne  $t0 , $t1 , ko_dung      # re nhanh neu a[i] != a[j]
              
              # neu trung thi di tiep 
              add $s0 , $s0 , 1   # i = i + 1 
              addi $s1 , $s1 , -1   # j = j - 1 
              j loop_check
              
              
              ko_dung: 
                   li $s6 , 0         # s6 = 0 => ko phai chuoi doi xung
                   jr $ra 
              
              end_loop_check: 
                   move $v0 , $s6 
                   jr $ra 