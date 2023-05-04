.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    
    addi t2, x0 , 10
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    # YOUR CODE HERE
  
     addi sp, sp, -4  # to save value of t2  because t2 is only register which i am using 
     sw t2, 0(sp)   
     add t2 ,x0,a0   # using t2 and negative 1 in every loop and multipling 
     addi t2 ,t2 ,-1  
    loop:
   
     beq  t2,x0, exit  
     mul a0 , a0,t2 
     addi t2 ,t2 ,-1
   j loop
exit:
    lw t2, 0(sp)       # copy back value of t2 from stack  
    addi sp, sp, 4

ret
    
    