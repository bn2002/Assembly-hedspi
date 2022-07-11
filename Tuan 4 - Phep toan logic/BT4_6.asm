.text
	addiu $t0, $zero, 60000
	ori $t0, $zero, 60000

# addiu là lệnh giả còn ori là lệnh thật
# 2 cách viết sẽ cho cùng 1 kết quả
# lệnh ori sẽ thực hiện nhanh hơn, do ori chỉ cần chạy 1 lệnh duy nhất, còn addiu phải chạy đến 3 lệnh thực là lui, ori và addu