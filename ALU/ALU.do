#do file ALU 8-bit.vhd
quit -sim
vsim -t ns ALU

add wave -divider "Inputs:"
add wave -color magenta -radix binary A B
add wave -color cyan -radix binary ALU_Sel

add wave -divider "Internal signals:"
add wave -color blue -radix binary ALU_Result tmp

add wave -divider "Outputs:"
add wave -color orange -radix binary ALU_Out
add wave -color yellow -radix binary Carryout

# simple addition
force A 00000100 
force B 00000100 
force ALU_Sel 0000 
run 35 ns

# carry adition
force A 11111111 
force B 00100000 
run 35 ns

# simple sub
force ALU_Sel 0001 
force A 00001000
force B 00000010
run 35 ns

# carry sub
force A 00001000
force B 11111111
run 35 ns

# simple mult
force ALU_Sel 0010 
force A 00001000
force B 00000010
run 35 ns

# carry mult
force A 11111111
force B 00000001
run 35 ns

# simple div
force ALU_Sel 0011 
force A 00000100
force B 00000100
run 35 ns

# Logical shift left
force ALU_Sel 0100
force A 01001001
run 35 ns

# Logical shift right
force ALU_Sel 0101
force A 10001001
run 35 ns

# Rotate left
force ALU_Sel 0110
force A 11001000
run 35 ns

# Rotate right
force ALU_Sel 0111
force A 11011000
run 35 ns

# Logical AND
force ALU_Sel 1000
force A 00000100
force B 11111111
run 35 ns

# Logical OR
force ALU_Sel 1001
force A 00010100
force B 00010111
run 35 ns

# Logical XOR
force ALU_Sel 1010
force A 10010010
force B 10000001
run 35 ns

# Logical NOR
force ALU_Sel 1011
force A 00010100
force B 00010111
run 35 ns

# Logical NAND
force ALU_Sel 1100
force A 00000100
force B 11111111
run 35 ns

# Logical XNOR
force ALU_Sel 1101
force A 10010010
force B 10000001
run 35 ns

# Greater comparison
force ALU_Sel 1110
force A 11111111 
force B 00000100 
run 35 ns

force A 00000100  
force B 11111111
run 35 ns

# Equal comparison 
force ALU_Sel 1111
force A 00000001
force B 00000001
run 35 ns

force A 00000100  
force B 11111111
run 35 ns