hello_world: hello_world.o
	ld -o build/hello_world build/hello_world.o

hello_world.o: hello_world.s
	rm -fr build
	mkdir build
	as -o build/hello_world.o hello_world.s
