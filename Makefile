CC=g++

all: lib/main target/simple/JavaCode.class

target/simple/JavaCode.class: java/simple/JavaCode.java
	$(JAVA_HOME)/bin/javac -cp ./jar/xeger-1.0-SNAPSHOT.jar -d target $<


lib/main.o: c/main.cc
	$(CC) -c -o $@ $^ -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux/

lib/main: lib/main.o
	$(CC) -v -o $@ -L${JAVA_HOME}/jre/lib/server/ $^ -ljvm
	
test: lib/main target/simple/JavaCode.class
	lib/main
clean:
	-rm -rfv target/*
	-rm -rf lib/*
