main:
main_prologue:
        push    $ra
main_body:
        li      $a0, 11
        li      $a1, 13
        li      $a2, 17
        li      $a3, 19
        jal     sum4            # sum4(11, 13, 17, 19)

        move    $a0, $v0 
        li      $v0, 1
        syscall                 # printf("%d", result)

        li      $v0, 0          # return 0
main_epilogue:
        pop     $ra
        jr      $ra

sum4:
sum4_prologue:
        push    $ra
        push    $s0 
        push    $s1
        push    $s2
        # $a0 = a; $a1 = b; $a2 = c; $a3 = d
        move    $s0, $a2 
        move    $s1, $a3
sum4_body:
        move    $a0, $a0
        move    $a1, $a1
        jal     sum2            # sum2(a, b)
        move    $s2, $v0        # $s2 = sum2(a, b)

        move    $a0, $s0
        move    $a1, $s1
        jal     sum2            # $v0 = sum2(c, d)
        
        move    $a0, $s2 
        move    $a1, $v0
        jal     sum2            # $v0 = sum2(res1, res2)
sum4_epilogue:
        pop     $s2 
        pop     $s1
        pop     $s0 
        pop     $ra
        jr      $ra

sum2: 
        add     $v0, $a0, $a1
        jr      $ra
