CC=g++

all:
	@$(CC) -Wall -c *.cpp
	@ar -cvq Math.a *.o

clean:
	@rm Math.a *.o