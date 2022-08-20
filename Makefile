CC=g++
CFLAGS=-I. -Wall -Wextra -g3 -v

DEPS = hellomake.h

%.o: %.cpp $(DEPS)
	$(CC) -cpp -o $@ $< $(CFLAGS)

hellomake: hello.o 
	$(CC) -o hellomake.exe hello.o
	 

