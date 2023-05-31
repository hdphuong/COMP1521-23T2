#include <stdio.h>

int main(void) {
	int x;
	while ((x = fgetc(stdin)) != EOF) {
		fputc(x, stdout);
	}
	// scanf("%d", &x);
	// printf("%d\n", x);
}
