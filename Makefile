CC = g++
CFLAGS = -g -c
STANDARD = -std=c++11


all: K-RRT 

K-RRT: K-RRT.o
	$(CC) -o $@ $? 
	$(CC) -o drawFigure drawFigure.o 

K-RRT.o:	K-RRT.cpp
	$(CC) $(STANDARD) $(CFLAGS) -o $@ K-RRT.cpp 
	$(CC) $(STANDARD) $(CFLAGS) -o drawFigure.o drawFigure.cpp 

clean:
	rm *.o *.txt K-RRT drawFigure 

