###################################################################
#This program display the method to perform matrix multiplication:
#First matrix: n*k
#Second matrix : k*m
#Along with a small  algorithm regards selection sort.
#
#Final Project
#CS-3340.005
#yxz157830
#12/01/2018
###################################################################


.text 
.globl main

main:
	la $a0,msg0 # display a message for user to input 
 	li $v0,4
	syscall    # print string "Please enter the value of n,k,m"
	add $t1 $zero $zero  # set register $t1 to 0. When $t1 == $t2, the loop ends and this is used for counting.
    
	addi $t2 $zero 3    # set $t2 = 3
	la $t3  init         # Load address $t3 to init
   	move $t8,$t3
	add $t4 $zero $zero  # Set the offset $t4 to 0

Loop:
   	li $v0 5             # read integer
	syscall             
   
	add $t5 $t4 $t3      # $t5 = $t3(init)+$t4(offset)
	sw $v0 0($t5)        # Put the number in $vo into the address corresponding to $t5
	add $t1 $t1 1        # $t1++
   	beq $t1 $t2 Exit     # If $t1 == $t2 means that if 3 numbers are entered, then the loop will end
	addi $t4 $t4 4       # $t4=$t4+4(offset)
	j Loop               # go to loop again
	
	
Exit:                      # finish input validation
   	add $t1 $zero $zero     # $t1 is set to 0. When $t1 == n*k, the loop ends and is used for counting.
	add $t4 $zero $zero     # $t4(offset) set to 0
	add $t2 $zero $zero 
	
#############################
# Initialization completed
#############################

A:
	add $t5 $t4 $t3      # Add the base address $t3 plus the offset $t4 to get the current address
	lw $a0 0($t5)  
	move $t1,$a0
	addi $t4 $t4 4       # Increase the offset value by 4 positions
 	add $t5 $t4 $t3      # Add the base address $t3 plus the offset $t4 to get the current address
 	lw $a0 0($t5)  
	move $t2,$a0
	addi $t4 $t4 4       # Increase the offset value by 4 positions?
 	add $t5 $t4 $t3      # Add the base address $t3 plus the offset $t4 to get the current address
  	lw $a0 0($t5)  
	move $t3,$a0

#################################################################
# Output the masseage, but seperate with msg1,$t1,msg5,$t2,msg6 
# t1,t2 stored the value of n and k
#################################################################

	la $a0,msg1   
 	li $v0,4
	syscall    ################# Enter the valye for the first n*k matrix ###################
	
	
	move $a0,$t1    
	li $v0 1   
	syscall
	
	la $a0,msg5
 	li $v0,4
	syscall
	
	move $a0,$t2    
	li $v0 1   
	syscall
	
	la $a0,msg6
 	li $v0,4
	syscall
############################################################
# Calculate the array space size
############################################################

	mul $t6,$t1,$t2      #$t6 represents the number of elements in the first array
	mul $t7,$t2,$t3	   #$t7 represents the number of elements in the second array
	mul $s2,$t1,$t3
	add $t1,$zero,4      #$t8 represents the space size of the first array
	mul $s0,$t6,$t1	   #$t9 represents the space size of the second array
	mul $s1,$t7,$t1      
	mul $s2,$s0,$t1      #$s0 represents the space size of the third array

############################################################
# sbrk (allocate heap memory) 
############################################################

      li $v0, 9	         
	add $a0, $zero,$s0	
	syscall 
	move $s0,$v0
	li $v0, 9	
	add $a0, $zero ,$s1	
	syscall
	move $s1,$v0
	li $v0, 9	
	add $a0, $zero ,$s2	
	syscall
	move $s2,$v0

	add $t2 $zero $zero     # offset value is set to 0
   	add $t1 $zero $zero     # $t1 is set to 0. When t1 == t2, the loop ends and is used for counting.
   	add $t2 $zero  $t6      # set the value of $t2 to 10 for easier comparison	
	move $t3,$s0 	  
	add $t4 $zero $zero  # set offset t4 value to 0
	
	
Loop1:
   	li $v0 5             # read integer
   	syscall            
   
	add $t5 $t4 $t3      # Add the base address $t3 to the offset $t4 to get $t5
   	sw $v0 0($t5)        # Put the number in $vo into the address corresponding to t5 
	add $t1 $t1 1        # $t1++
   
	beq $t1 $t2 Exit1     # If $t1 == $t2 means that 10 numbers are entered, then jump to Exit1
	addi $t4 $t4 4       
	j Loop1               # back to loop1
Exit1:                      # Finish input
	add $t1 $zero $zero     # Set $t1 to 0, when t1 == k*m ends the loop, this is use for counting
	add $t4 $zero $zero     
	add $t2 $zero $zero
	
#############################
# Initialization completed
#############################

B:
	la $t3  init
	add $t5 $t4 $t3      # Add the base address $3 plus the offset $4 to get the current address
	lw $a0 0($t5)  
	move $t1,$a0
	addi $t4 $t4 4       # Increase the offset value by 4
 	add $t5 $t4 $t3      # Add the base address $3 plus the offset $4 to get the current address
 	lw $a0 0($t5)  
	move $t2,$a0
	addi $t4 $t4 4       # Increase the offset value by 4 ?
 	add $t5 $t4 $t3      # Add the base address $3 plus the offset $4 to get the current address
  	lw $a0 0($t5)  
	move $t3,$a0
	
#################################################################
# Output the masseage, but seperate with msg2,$t2,msg5,$t3,msg6 
# t2,t3 stored the value of k and m
#################################################################

	la $a0,msg2
 	li $v0,4
	syscall    ##########################Enter the valye for the second k*m matrix###############
	
	move $a0,$t2    
	li $v0 1   
	syscall
	
	la $a0,msg5
 	li $v0,4
	syscall
	
	move $a0,$t3    
	li $v0 1   
	syscall
	
	la $a0,msg6
 	li $v0,4
	syscall

	add $t2 $zero $zero  
	add $t1 $zero $zero  # set $t1 to 0. When t1 == t2, the loop ends and this is used for counting.
	add $t2 $zero  $t7   # set the value of t2 to 10 for easier comparison
	
	add $t3 ,$zero $s1	
	add $t4 $zero $zero  
	
Loop2:   
	li $v0 5             # read integer
	syscall              
 
	add $t5 $t4 $t3      
	sw $v0 0($t5)        # Put the number in $vo into the address corresponding to $t5   
	add $t1 $t1 1        
	beq $t1 $t2 Exit2     # If $t1 == $t2 means that 10 numbers are entered, then jump to Exit2?  
	addi $t4 $t4 4       
	j Loop2              # back to Loop2
	
Exit2:                    # Finish input
	add $t1 $zero $zero     # $t1 is set to 0. When t1 == 10, the loop ends and is used for counting.  
	add $t4 $zero $zero     
	add $t2 $zero $t6
	
#######################################################################################
# Initialization completed, since $t2 has not been modified, it is not initialized
#######################################################################################
	 
####################################
# Matrix multiplication algorithm 
####################################

	la $t3  init
	add $t5 $t4 $t3      # Add the base address $3 plus the offset $4 to get the current address 
	lw $a0 0($t5)  
	move $s3,$a0
	addi $t4 $t4 4       # Increase the offset value by 4 positions 
 	add $t5 $t4 $t3      # Add the base address $3 plus the offset $4 to get the current address
 	lw $a0 0($t5)   
	move $s4,$a0  
	addi $t4 $t4 4       # Increase the offset value by 4 positions  
 	add $t5 $t4 $t3      # Add the base address $3 plus the offset $4 to get the current address
  	lw $a0 0($t5)  
	move $s5,$a0
	
	add $t7 $zero $zero
	add $t8 $zero $zero
	add $t9 $zero $zero

	add $t4 $zero $zero
	add $t9 $zero $zero
	add $t1 $zero $zero
	add $t2 $zero $zero
	
	la $a0 str           # Print string " "  
	li $v0 4                
	syscall
  
    add $s6 $zero $zero
LoopM_first:
	add $t8 $zero $zero
	LoopM_second: 
		add $t4 $zero $zero
		add $t6 $zero $zero
		add $t7 $zero $zero
		
		mul $t1,$s4,4			   #Calculate the order of the first array
		mul $t1,$t1,$t9
		add $t1 $t1 $t4
		
		mul $t2,$t8,4                    #Calculate the order of the second array
		mul $t3,$t4,$s5
		add $t2 $t2 $t3
		LoopM_third:
			
			add $t5 $t1 $s0       # t1= $t9 * k + $t4
			lw $a0 0($t5)      
			add $t1,$zero,$a0
					
			
			add $t5 $t2 $s1			
			lw $a0 0($t5)      
			add $t2,$zero,$a0
			
			mul $t3,$t1,$t2	   #t3 = t1 * t2
			
			add $t6,$t6,$t3    #t6 = t6 + t3
			
			addi $t4 $t4 4 
			
			mul $t1,$s4,4			  #Calculate the order of the first array
			mul $t1,$t1,$t9
			add $t1 $t1 $t4
			
			mul $t2,$t8,4       # t2 = $t8 * 4 + $t4 * m
			mul $t3,$t4,$s5
			add $t2 $t2 $t3
			
			add $t7 $t7 1        # $t7++ 
			beq $t7 $s4 M_t 
			j LoopM_third 
		M_t:
		    move $v0,$t6
			add $t5 $s6 $s2      # $t5 = $t6 + $s2 
			sw $v0 0($t5)        # Put the number in $vo into the address corresponding to t5
			addi $s6 $s6 4
	add $t8 $t8 1        # t8++ 
	beq $t8 $s5 M_t2     
	j LoopM_second 
	
	M_t2:
			
	add $t9 $t9 1        # t9++
	beq $t9 $s3 Exit_first     # If $t1 == $t2 means that it is looped k times, then it jumps to the Exit_first 
	addi $t4 $t4 4       
	j LoopM_first               # back to the LoopM_first
	
Exit_first:                    
	add $t1 $zero $zero     # Set $t1 to 0. When t1 == t2, it means that it is looped n times, then it jumps out of the loop.
	add $t4 $zero $zero     
	
#########################
# Output array
#########################
	la $a0,str4          # change line ¡Œ
 	li $v0,4
	syscall
	
	add $t4 $zero $zero
	
	la $t3  init
	add $t5 $t4 $t3      # Add the base address $3 plus the offset $4 to get the current address
	lw $a0 0($t5)  
	move $t1,$a0
	addi $t4 $t4 4       # Increase the offset value by 4 positions
 	add $t5 $t4 $t3      # Add the base address $3 plus the offset $4 to get the current address
 	lw $a0 0($t5)  
	move $t2,$a0
	addi $t4 $t4 4       # Increase the offset value by 4 positions?
 	add $t5 $t4 $t3      # Add the base address $3 plus the offset $4 to get the current address
  	lw $a0 0($t5)  
	move $t3,$a0

	mul $t6,$t1,$t2          #$t6 represents the number of elements in the first array
	mul $t7,$t2,$t3		 #$t7 represents the number of elements in the second array
	
	add $t2 $zero $t6
	add $t1 $zero $zero   
	add $t4 $zero $zero 
	
	la $a0,msg7          #Running: 
 	li $v0,4
	syscall 

Loop3:                   ################### Output the first array############
	div $t8,$t1,$s4
	mul $t8,$t8,$s4
	sub $t8,$t1,$t8
	
	beq $t8 0 Ex_t
	
p1:	add $t5 $t4 $s0      # Add the base address $3 plus the offset $4 to get the current address 
	lw $a0 0($t5)      
	li $v0 1  
	syscall
  
	la $a0 str           # Output tab space 
	li $v0 4                
	syscall
	
	div $t8,$t1,$s4
	mul $t8,$t8,$s4
	sub $t8,$t1,$t8
	move $t9,$s4
	sub $t9,$t9,1
	beq $t8 $t9 Ex_t2
    
p2:	add $t1 $t1 1        
	beq $t1 $t2 Exit3    # If $t1 == $t2 means that the number of t2 is output, then the jump to Exit3
	
	addi $t4 $t4 4      
	j Loop3              # back to Loop3
Ex_t:
	la $a0,str2       #[
 	li $v0,4
	syscall
	j p1
Ex_t2:
	la $a0,str3       #"]"
	li $v0,4
	syscall
	la $a0,str4       #"\n"
 	li $v0,4
	syscall
	j p2
Exit3:                    # Input Completed
	add $t1 $zero $zero     
	add $t4 $zero $zero     
#######################################################################################
# Initialization completed, since $t2 has not been modified, it is not initialized
#######################################################################################
	add $t2 $zero $t7 
	
	la $a0,msg3          #.multiplied by:
 	li $v0,4
	syscall 
Loop4:                   ################################# Output the second array#############
	div $t8,$t1,$s5
	mul $t8,$t8,$s5
	sub $t8,$t1,$t8
	
	beq $t8 0 Ex_t3   # go to Ex_t3 if $t8=0 
	
p3:	add $t5 $t4 $s1      # Add the base address $3 plus the offset $4 to get the current address
	lw $a0 0($t5)      
	li $v0 1  
	syscall
  
	la $a0 str           # Output tab space
	li $v0 4                
	syscall
	
	div $t8,$t1,$s5
	mul $t8,$t8,$s5
	sub $t8,$t1,$t8
	move $t9,$s5
	sub $t9,$t9,1
	beq $t8 $t9 Ex_t4
    
p4:	add $t1 $t1 1        # $t1++
	beq $t1 $t2 Exit4    # If $t1 == $t2 means that the number of k*m is output, then the loop is jumped out.
	
	addi $t4 $t4 4       
	j Loop4              # jump back to Loop4
	
Ex_t3:
	la $a0,str2       #[
 	li $v0,4
	syscall
	j p3
Ex_t4:
	la $a0,str3       #"]"
	li $v0,4
	syscall
	la $a0,str4       #"\n"
 	li $v0,4
	syscall
	j p4
	
Exit4:                   # Input Completed
	add $t1 $zero $zero     
	add $t4 $zero $zero     
	mul $t7,$s3,$s5
	add $t2 $zero $t7 
	
#######################################################################################
# Initialization completed, since $t2 has not been modified, it is not initialized
#######################################################################################	

      la $a0,msg4          #equals: 
 	li $v0,4
	syscall 

Loop5:                    ################################# Output result array #############
	div $t8,$t1,$s5
	mul $t8,$t8,$s5
	sub $t8,$t1,$t8
	
	beq $t8 0 Ex_t5
	
p5:	add $t5 $t4 $s2      # Add the base address $3 plus the offset $4 to get the current address
	lw $a0 0($t5)      
	li $v0 1  
	syscall
  
	la $a0 str           # Output tab space 
	li $v0 4                
	syscall
	
	div $t8,$t1,$s5
	mul $t8,$t8,$s5
	sub $t8,$t1,$t8
	move $t9,$s5
	sub $t9,$t9,1
	beq $t8 $t9 Ex_t6
    
p6:	add $t1 $t1 1        
	beq $t1 $t2 Exit5    # If $t1 == $t2 means that the number of n*m is output, then the jump to Exit5
	
	addi $t4 $t4 4      
	j Loop5              # back to Loop5 
	
Ex_t5:
	la $a0,str2       #[
 	li $v0,4
	syscall
	j p5
Ex_t6:
	la $a0,str3       #"]"
	li $v0,4
	syscall
	la $a0,str4       #"\n"
 	li $v0,4
	syscall
	j p6
#Exit5:                    	
#	li $v0 10            # exit the program if you want to end matrix multiplycation prgram   
#	syscall

############################  # sorting program is adding here
Exit5:
	la $a0,msg8
 	li $v0,4
	syscall    # input Enter Size"
    
	li $v0 5            
	syscall              
   
    la $t3  sort_init 
	add $t5 $zero $t3      
	sw $v0 0($t5)
	move $s0,$v0
	move $t2,$v0
	mul $s0,$s0,4
	
	li $v0, 9	# sbrk (allocate heap memory)
	add $a0, $zero,$s0	
	syscall 
	move $s0,$v0

	add $t1 $zero $zero
	add $t4 $zero $zero
sort_Loop:
	la $a0,msg9
 	li $v0,4
	syscall
	
   	li $v0 5             
	syscall              
   
	add $t5 $t4 $s0      
	sw $v0 0($t5)        
	add $t1 $t1 1        # $t1 = $t1 + 1
   	beq $t1 $t2 sort_Exit      
	addi $t4 $t4 4       
	j sort_Loop               # switch Loop
sort_Exit:                    
   	add $t1 $zero $zero      
	add $t4 $zero $zero     

	move $s4,$t2  # s4 = n-1
	sub $s4,$s4,1
	
###############################
# selection sort algorithm
###############################
sorted_first:
	move $t6,$t1         # k = i
	add $t7 $t1 1        # j = i+1
	
sort_p1:	beq $t7 $t2 sort_Exit_second  #j<n? End of inner loop
	mul $t8 $t6 4
	mul $t9 $t7 4
	
	move $t4,$t8         #get a[k]
	move $t3,$s0
	add $t5 $t4 $t3         
	lw $a0 0($t5)  
	move $s1,$a0
	
	move $t4,$t9         #get a[j]
	move $t3,$s0
	add $t5 $t4 $t3         
	lw $a0 0($t5)  
	move $s2,$a0
	
	bge $s1 $s2 sort_Exit_first   # if(a[j]<a[k]) switch	
	j sort_p4
sort_p3:	beq $t1 $s4 sort_Exit_print   #if i<n-1? Outer loop end
	j sorted_first
sort_Exit_first:
	move $t6,$t7
sort_p4:	add $t7 $t7 1        #j++	
	j sort_p1
sort_Exit_second:
	bge $t6 $t1 sort_Exit_third   # if(k>i)
	j sort_p2
	
sort_Exit_third:
	mul $s5,$t1,4
	mul $s6,$t6,4
	
	add $t5 $s5 $s0       
	lw $a0 0($t5)  
	move $s7,$a0
	
	add $t5 $s6 $s0       
	lw $a0 0($t5)  
	move $s3,$a0
	
	add $t5 $s6 $s0      
	move $v0,$s7      #switch
	sw $v0 0($t5) 
	
	add $t5 $s5 $s0      
	move $v0,$s3       
	sw $v0 0($t5) 
	
sort_p2:	add $t1 $t1 1        #i++
	j sort_p3
sort_Exit_print:
	add $t1 $zero $zero       
	add $t4 $zero $zero 
	
	la $a0,msg10
 	li $v0,4
	syscall    #Sorted Array"
	
##############################
# output array
##############################

sort_Loop2:
	add $t5 $t4 $s0      
	lw $a0 0($t5)      
	li $v0 1  
	syscall
  
	la $a0 sort_str             
	li $v0 4                
	syscall
	
	add $t4 $t4 4 
	
	add $t1 $t1 1        
	beq $t1 $t2 sort_Exit2
	j sort_Loop2
sort_Exit2:                    # end the entire program      	 	
	li $v0 10             
	syscall
############################
.data 
	str:  .asciiz "\t"
	str2: .asciiz "["
	str3: .asciiz "]"
	str4: .asciiz " \n"
	str5: .asciiz " "
      init: .word 0,0,0
	msg0: .asciiz "Please enter values for n, k, and m:  \n"
	msg1: .asciiz "Please enter values for the first matrix ("
	msg2: .asciiz "Please enter values for the second matrix ("
	msg3: .asciiz "multiplied by:  \n"
	msg4: .asciiz "equals: \n"
	msg5: .asciiz "*"
	msg6: .asciiz "):\n"
	msg7: .asciiz "Running:\n"
	
	sort_init: .word 0
	sort_str:  .asciiz " "
	msg8: .asciiz "\nEnter Array Size: "
	msg9: .asciiz "Enter Integer: "
	msg10: .asciiz "Sorted Array: "

