N_SIZE = 10

	.text
main:
main_loop_init:
	li	$t0, 0	#int i = 0
main_loop_cond:
	bge	$t0, N_SIZE, main_loop_end
main_loop_body:
	mul	$t1, $t0, 4
	lw	$a0, numbers($t1)	# numbers[i]
	li	$v0, 1		
	syscall			# printf("%d",numbers[i])

	li	$a0, '\n'
	li	$v0, 11
	syscall			#printf("\n")
main_loop_incr:
	addi	$t0, $t0, 1
	b	main_loop_cond

main_loop_end:
	jr	$ra

	.data

numbers:
	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
