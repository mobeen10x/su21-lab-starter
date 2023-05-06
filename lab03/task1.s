
.globl main

.data
a:  .word 7
i:  .word 0   # giving starting value to i 
b: 
    .word   0
    .word   0
    .word   0
    
    
.text

main:
 la s2, b
 
  la t0, i
  lw s0, 0(t0)   # loading the value from memory of i in s0 as required 
  
   la t0, a
  lw s1, 0(t0)  # loading the value from memory of a in s1 as required 
 
   addi t0 , x0 , 3   # temprary register for max number of iterations of loop
  
   add t4 , x0 ,x0 
    loop:
   
     bge   s0,t0, exit   # condition check i< 3 bcz s0 is i and t0 is 3 
     
     mul t3 , s0,s1   # this part of code (i * a) 
     add t3 , t3 , s1  # now adding the previous one 
     
     slli t4, s0, 2  # now i*4  because memory is 4 byte for 1 value of array 
     add t4 , t4 , s2   # adding base address to index  
     sw t3, 0(t4)  # storing the value to memory 
     addi s0 , s0 , 1  # indexing register 
   j loop
exit: 
