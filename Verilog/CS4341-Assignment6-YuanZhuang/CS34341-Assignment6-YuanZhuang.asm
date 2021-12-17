.data   # data declaration section
num1: .word 0
num2: .word 0

choice: .space 1
char: .asciiz "C"

words1: .asciiz "\nPlease enter the integer that you want to calculate:\n"  # Show message to user.
menu: .asciiz "\nMenu \n 1. Addition\n 2. Subtraction \n 3. Multiplication \n 4. Division \n Please select your choice:"
repeat: .asciiz "\n Press C is u would like to continue, and Q to quit:"
result: .asciiz "Result is "


.text  # text section
main:
continue:  # function name
li $v0, 4  #syscall to print string.
la $a0, words1  #Load base address for words1
syscall  # Print string.

li $v0, 5  #Syscall to read
syscall
sw $v0, num1 #store the first input integer

li $v0, 5
syscall
sw $v0, num2


li $v0, 4   # Print menu message.
la $a0, menu
syscall


li $v0, 5   # Read input choice
syscall
move $a1, $v0  #Store to a1

beq $a1, 1, addition    # branch if user input = 1 or 2 or 3 or 4 for a specific operation.
beq $a1, 2, subtraction
beq $a1, 3, multiplication
beq $a1, 4, division


UserDecision:

li $v0, 4    # Print repeat string.
la $a0, repeat
syscall


li $v0,12  # Read and store charactor
syscall
sb $v0, choice

lb $t2, choice   # if the user choice is continue then , go to continue. else stop the program.
lb $t3, char
beq $t2, $t3, continue
j EndProgram

addition:   #Addition function.

lw $t4, num1   #Load num1 and num2
lw $t5, num2
add $t6, $t4, $t5

li $v0, 4     # Print result.
la $a0, result
syscall

li $v0, 1  #Print result value.
move $a0, $t6
syscall

j UserDecision

subtraction: #Subtraction function.

lw $t4, num1  # Subtraction operation.
lw $t5, num2
sub $t6, $t4, $t5

li $v0, 4  # Print result and value
la $a0, result
syscall

li $v0, 1
move $a0, $t6
syscall

j UserDecision


multiplication:  # Multiplication function.

lw $t4, num1   # Load and operating numbers
lw $t5, num2
mul $t6, $t4, $t5

li $v0, 4      # Print result and value
la $a0, result
syscall

li $v0, 1
move $a0, $t6
syscall

j UserDecision

division:  #Devision function.

lw $t4, num1
lw $t5, num2
div $t6, $t4, $t5

li $v0, 4
la $a0, result
syscall

li $v0, 1
move $a0, $t6
syscall
j UserDecision

EndProgram:   
li $v0, 10   # Syscall to end program.
syscall