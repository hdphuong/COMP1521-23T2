main:
main_outer_init:
	li	$t0, 1        # int i = 1
main_outer_cond:
	bgt 	$t0, 10, main_outer_end   # if (i > 10) goto end
main_outer_body:
main_inner_init:
	li  	$t1, 0      # int j = 0
main_inner_cond:
	bge 	$t1, $t0, main_inner_end  # if (j >= i) goto end
main_inner_body:
	li  	$v0, 11
	li  	$a0, '*'
	syscall
main_inner_inc:
	addi  $t1, $t1, 1   # j++
	b     main_inner_cond
main_inner_end:
	li  	$v0, 11             # printf("\n")
	li  	$a0, '\n'
	syscall

main_outer_inc:
	addi  $t0, $t0, 1     # i++
	b     main_outer_cond

main_outer_end:
	li  	$v0, 0
	jr 	$ra

	.data
string:
	.asciiz "hello\n"
