.globl main

.data
i: .word 0
num: .word 1  # for testing 

.text


subt:   
     # a1 = i  = b 
     # a0 = num  = a
     # return is also a1    
     sub a1 , a0, a1 
     ret 
compare:   

     # a1 = i   = b 
     # a0 = num  = a 
     # return is also a1 

      addi sp, sp, -4  # to save return address 
      sw ra, 0(sp) 
    
      jal subt 
     
      lw ra, 0(sp)
      addi sp, sp, 4
     
     
      bge   a1,x0, exit1   # condition check i< 10 bcz s0 is i and t0 is 10
      
      addi a1 , x0 , 0 
      ret 
     
      exit1 : 
      addi a1 , x0 , 1 
      ret 
     

     

main:
  
     la t0, i
     lw s0, 0(t0) # getting value of  i in s0 register 
    
    la t0, num    
    lw a0, 0(t0)    # getting value of num into a0 register 
    
    addi t0 , x0 , 10  # counter of loop 
    
    addi sp, sp, -40   # because size of array is 10*4 
    
    addi t1 , x0 , 36    # to make easy for indexing 
    add  t1 , sp , t1    # sp + last value index of stack 
        loop:
  
        bge   s0,t0, exit   # condition check i< 10 bcz s0 is i and t0 is 10
        addi sp, sp, -12  # because size of 4 registers to save  is 4*4 
   
        sw t1, 8(sp) # save t1 for use afterwards
        sw t0, 4(sp) # save t0 for use afterwards
        sw a0, 0(sp) # save a0 for use afterwards
      
        
        add a1 , x0 , s0   # for calling convention 
        
        
        jal compare    # function call of compare 
          
        lw a0, 0(sp) # restore register a0 for caller
        lw t0, 4(sp) 
        lw t1, 8(sp) 
        
        addi sp, sp, 12  # because size of 4 registers to save  is 4*4 
        sw   a1, 0(t1)          # adding value in stack and assuming a1 will be return value of function and t1 is address 
        
        addi t1 ,t1 , -4    # indexing of stack 
  
  
     addi s0 , s0 , 1  # indexing register 
   j loop
   
    exit : 
     addi sp, sp, 40   # because size of array is 10*4 
    
    
