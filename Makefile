CC=g++

all: lib/main target/simple/JavaCode.class

target/simple/JavaCode.class: java/simple/JavaCode.java
	$(JAVA_HOME)/bin/javac -cp ./jar/xeger-1.0-SNAPSHOT.jar -d target $<


lib/main.o: c/main.cc
	$(CC) -c -o $@ $^ -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux/

lib/main: lib/main.o
	$(CC) -v -o $@ -L${JAVA_HOME}/jre/lib/server/ $^ -ljvm

# lib/main-Recent: 
# 	g++ -g -I${JAVA_HOME}/include/ -I${JAVA_HOME}/include/linux/ -L/usr/bin/java\
# 	-L${JAVA_HOME}/jre/lib/amd64/server/ c/main.cc -o lib/main -ljvm

test: lib/main target/simple/JavaCode.class
	lib/main
clean:
	-rm -rfv target/*
	-rm -rf lib/*
