FLAG_ROWS = 6
FLAG_COLS = 12

main:
main_row_loop_init:
        li      $t0, 0          # int row = 0
main_row_loop_cond:
        bge     $t0, FLAG_ROWS, main_row_loop_end
main_row_loop_body:
main_col_loop_init:
        li      $t1, 0          # int col = 0
main_col_loop_cond:
        bge     $t1, FLAG_COLS, main_col_loop_end
main_col_loop_body:
        # calculation of the offset:
        mul     $t2, $t0, FLAG_COLS # row * row_length
        add     $t2, $t2, $t1       # (row * row_length) + col
        mul     $t2, $t2, 1         # ((row * row_length) + col) * size_of_elem

        la      $t3, flag 
        add     $t3, $t3, $t2   # $t3 = &flag[row][col]

        lb      $a0, ($t3)      # $a0 = flag[row][col]
        li      $v0, 11
        syscall                 # printf("%c", flag[row][col])
main_col_loop_incr:
        addi    $t1, $t1, 1
        b       main_col_loop_cond
main_col_loop_end:
        li      $a0, '\n'
        li      $v0, 11
        syscall
main_row_loop_incr:
        addi    $t0, $t0, 1
        b       main_row_loop_cond
main_row_loop_end:
        jr      $ra

	.data
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
