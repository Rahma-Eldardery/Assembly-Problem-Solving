#The rules were deceptively simple. Pick any positive integer.

#If it's even, divide it by 2.
#If it's odd, multiply it by 3 and add 1.
#Then, repeat these steps with the result, continuing indefinitely.

#Curious, you picked number 12 to test and began the journey:

#12 ➜ 6 ➜ 3 ➜ 10 ➜ 5 ➜ 16 ➜ 8 ➜ 4 ➜ 2 ➜ 1

.data 
   prompt: .asciiz "Enter a number: "
   msg: .asciiz "Number of steps: "
   
.text
    .globl main
    main:
    li $v0 , 4
    la $a0 , prompt
    syscall
    
    li $v0 , 5
    syscall 
    move $a0 , $v0
    jal steps
    
    li $v0 , 4
    la $a0 , msg
    syscall 
    
    li $v0 , 1
    move $a0 , $v1
    syscall
    
    li $v0 , 10
    syscall 
    
    
 steps:
 blez  $a0, invalid
 move  $t1, $zero  # Steps counter = 0
loop: beq  $a0, 1, done  
      andi $t0, $a0, 1   
      beqz $t0, even     
      j odd              
even:
  srl   $a0, $a0, 1        
  addi $t1, $t1, 1   
  j loop
odd:
  li   $t2, 3        
  mul  $a0, $a0, $t2 
  addi $a0, $a0, 1   
  addi $t1, $t1, 1   
  j loop
done:
  move $v1, $t1      
  jr   $ra 
invalid:
  li    $v1, -1        
  jr    $ra
  
 