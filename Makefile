J=java
JC=javac
JCC=javacc

MAIN_CLASS=Lugosi

FILE ?= minimal.lug

all: $(MAIN_CLASS).class

build/bin/$(MAIN_CLASS).class: Lugosi.jj
	$(JCC) -OUTPUT_DIRECTORY=build/src Lugosi.jj
	$(JC)  build/src/*.java -d build/bin

run: build/bin/$(MAIN_CLASS).class
	$(J) -cp build/bin/ $(MAIN_CLASS) $(FILE)

clean:
	rm -rf build/src/*.java
	rm -rf build/bin/*class
