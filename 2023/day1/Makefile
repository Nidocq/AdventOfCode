GCC=gcc -g -arch arm64 -Wall -Wextra -pedantic -std=gnu11
filename=sol

all: $(filename).c phutils.o
	$(GCC) $(filename).c *.o -o $(filename) && ./$(filename)

phutils.o: /Users/liema/Code/C/phutils/src/phutils.c
	$(GCC) -c $<

clean:
	rm -rf *.o *.dSYM $(filename)


