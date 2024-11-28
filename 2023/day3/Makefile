GCC=gcc -g -arch arm64 -Wall -Wextra -pedantic -std=gnu11
filename=sol
all: $filename clean

$filename: $(filename).c
	$(GCC) $(filename).c -o $(filename) && ./$(filename)

clean:
	rm -rf *.o *.dSYM $(filename)


