

ifdef DEBUG
DEBUG_FLAGS = -g
else
DEBUG_FLAGS =  
endif

%.o: %.s
	rm -fr build
	mkdir build
	as $(DEBUG_FLAGS) $< -o build/$@

code: code.o
	ld build/code.o -o build/code
