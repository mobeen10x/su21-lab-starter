

.globl factorial


.text              
// start code here
main:
    la t0, n
    lw a0, 0(t0)
    
    la t0, result
    lw a1, 0(t0)
    
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
 
   
    addi sp, sp, -8     # Create stack frame
    sw ra, 0(sp)          # Save return address
    sw s0, 4(sp)          # Save s0
   # sw s1, 8(sp)          # Save s1 
   
    # If num <= 1, return 1
    li s0, 1              # Load 1 into s0

    ble a0, s0, end       # Compare num and 1, branch if less than or equal to
    # Otherwise, call factorial(num-1) and return num * factorial(num-1)
    addi sp, sp, -4       # Create space for argument
   
    sw  a0 , 0(sp)
    addi a0, a0, -1       # num-1
     
    jal ra, factorial     # Call factorial recursively
    lw a0, 0(sp)          # Load return value of recursive call into s0
    addi sp, sp, 4        # Remove argument from stack
    
    la t0, result
    lw t1, 0(t0)
    
    mul t1, t1, a0        # Multiply num by the result of the recursive call
    add a1 , x0,t1
    sw t1 , 0(t0)
    
end:
    # Function epilogue
    # lw s1 ,8(sp)
    lw s0, 4(sp)          # Restore s0
    lw ra, 0(sp)          # Restore return address
    add a0,x0,a1
    addi sp, sp, 8      # Remove stack frame
    jr ra                # Return to caller



// end code here

write_tohost:

li x1, 1

sw x1, tohost, t5

j write_tohost

.data 

// start data section here
n: .word 0
result: .word  1
// end data section here

.align 12

.section ".tohost","aw",@progbits;                            

.align 4; .global tohost; tohost: .dword 0;                     

.align 4; .global fromhost; fromhost: .dword 0; 
