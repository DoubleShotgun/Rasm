CC=gcc
CFLAGS=-O3
Nelua:
	cd src; nelua --cc $(CC) -rMs -o /usr/local/bin/rasm main.nelua
CC:
	$(CC) $(CFLAGS) -o /usr/local/bin/rasm rasm.c
