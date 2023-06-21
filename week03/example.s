main:
	li	$t0, 10	        # $t0 = 10	

	sw	$t0, number	# number = 10
	lw	$t1, number	# $t1 = number = 10

	.data
number:
	.space 4


