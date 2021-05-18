CC = g++
FLAGS = -fPIC -g -O0
SOURCE = tracker.cpp brokap.cpp SceneDrawer.cpp data.cpp
INCLUDE = -I/usr/include/ni/ -I/usr/include/python3.8
LIBS = -lOpenNI -lglut -lGL -lpython3.8

all: cython
	$(CC) $(FLAGS) $(SOURCE) $(INCLUDE) $(LIBS) -o brokap_server

cython: brokap.pyx
	cython --cplus brokap.pyx --embed

bootstrap:
	./bootstrap.sh

clean:
	rm -rf brokap.so brokap.cpp *.pyc
