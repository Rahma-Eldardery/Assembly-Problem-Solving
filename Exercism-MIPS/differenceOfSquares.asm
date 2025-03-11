   #Find the difference between the square of the sum 
   #and the sum of the squares of the first N natural numbers.
   
  .data
    prompt: .asciiz "Enter a number: "
    result: .asciiz "Difference of squares: "
    
    .text
    .globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $a0, $v0  

    jal difference_of_squares  

    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $v1 
    syscall

    li $v0, 10
    syscall

difference_of_squares:
    move $t0, $zero  
    move $t1, $zero   
    move $t3, $a0     

loop: 
    beqz $a0, done  
    mul  $t2, $a0, $a0   
    add  $t0, $t0, $t2   
    add  $t1, $t1, $a0   
    subi $a0, $a0, 1     
    j loop 

done:
    mul $t1, $t1, $t1   
    sub $v1, $t1, $t0    
    jr $ra              
