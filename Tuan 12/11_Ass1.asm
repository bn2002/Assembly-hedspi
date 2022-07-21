#------------------------------------------------------
# command row number of hexadecimal keyboard (bit 0 to 3)
# Eg. assign 0x1, to get key button 0,1,2,3
# assign 0x2, to get key button 4,5,6,7
# NOTE must reassign value for this address before reading,
# eventhough you only want to scan 1 row
.eqv IN_ADRESS_HEXA_KEYBOARD 0xFFFF0012
# receive row and column of the key pressed, 0 if not key pressed
# Eg. equal 0x11, means that key button 0 pressed.
# Eg. equal 0x28, means that key button D pressed.
.eqv OUT_ADRESS_HEXA_KEYBOARD 0xFFFF0014

.text
main: 
li $t1, IN_ADRESS_HEXA_KEYBOARD
li $t2, OUT_ADRESS_HEXA_KEYBOARD
li $t3, 0x08 # check row 4 with key C, D,E, F
polling: 
	sb $t3, 0($t1 ) # must reassign expected row
	lb $a0, 0($t2) # read scan code of key button
print: 
	li $v0, 34 # print integer (hexa)
	syscall
sleep: 
	li $a0, 100 # sleep 100ms
	li $v0, 32
syscall
back_to_polling: 
	j polling # continue polling
