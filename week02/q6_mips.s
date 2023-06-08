	.text
main:
	li  	$v0, 4        #printf("Enter a number")
	la  	$a0, string
	syscall

	li  	$v0, 5        # scanf(%d, &x)
	syscall

	# after syscall, input value is in 	$v0
	move  $t0, $v0    #t0 = x

	ble 	$t0, 100, small_big
	bge 	$t0, 1000, small_big
	 
	li  	$v0, 4
	la  	$a0, medium_string
	syscall

	j   return

small_big:
	li  	$v0, 4
	la  	$a0, small_big_string
	syscall

return:
	li  	$v0, 0
	jr  	$ra

	 .data
string:
	.asciiz "Enter a number: "
medium_string:
	.asciiz "medium\n"
small_big_string:
	.asciiz "small/big\n"

