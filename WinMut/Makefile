all:
	$(CC) sum.c -o muttest

clean:
	# rm !("Makefile"|"config.sh"|"sum.c"|"SumTest")
	find . -maxdepth 1 -type f -not \( -name "Makefile" -o -name "config.sh" -o -name "sum.c" -o -name "SumTest" \) -exec rm {} +

