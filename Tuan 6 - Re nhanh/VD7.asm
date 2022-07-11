.data
	prompt: .asciiz "\nEnter an integer, -1 to stop: "
	error: .asciiz "\nValues for n must be > 0"
	output: .asciiz "\nThe total is: "
	
.text
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	start_outer_loop:
		sne $t1, $s0, -1
		beqz $t1, end_outer_loop
		
		#If test for valid input
		slti $t1, $s0, -1
		beqz $t1, else
			la $a0, error
			jal PrintString
			b end_if
		
		else:
			#else block
			li $s1, 0 # i
			li $s2, 0 # inittialaze loop
			start_inner_loop:
				sle $t1, $s1, $s0
				beqz $t1, end_inner_loop
				add $s2, $s2, $s1
				addi $s1, $s1, 1
				b start_inner_loop
			
			end_inner_loop:
				la $s0, output
				move $a1, $s2
				jal PrintInt
		
		end_if:
			la $a0, prompt
			jal PromptInt
			move $s0, $v0
			b start_outer_loop
		
	end_outer_loop:
		jal Exit
				
		


.include "utils.asm"