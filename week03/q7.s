N_SIZE = 40

main:
main_loop_init:
        li      $t0, 0  # int i = 0
main_loop_cond:
        bge     $t0, N_SIZE, main_loop_end
main_loop_body:
        lw      $t1, numbers($t0)
        bge     $t1, 0, main_loop_incr

        addi    $t1, $t1, 42
        sw      $t1, numbers($t0)
main_loop_incr:
        addi    $t0, $t0, 4
        b       main_loop_cond
main_loop_end:
	jr 	$ra

        .data
numbers:
        .word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9
