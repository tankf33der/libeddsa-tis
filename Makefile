all: c
	clang -DUSE_64BIT=0 -fsanitize=address,undefined *.c && ./a.out
	clang -fsanitize=memory *.c && ./a.out
c:
	rm -rf *.o *.out
