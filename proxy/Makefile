destdir := bin
files	:= proxy shell-lib resolve

CC = gcc

$(srctree)/$(component)/resolve: $(srctree)/$(component)/resolve.c
	$(CC) -Wall -g -O2 $< -o $@
