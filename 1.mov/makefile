OBJS = mov.o

ifdef DEBUG
DEBUG_FLAGS = -g
else
DEBUG_FLAGS =  
endif

%.o : %.s
	rm -fr build
	mkdir build
	as $(DEBUG_FLAGS) $< -o build/$@

mov: $(OBJS)
	ld -o build/mov build/$(OBJS)
