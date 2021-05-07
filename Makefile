CFLAGS = -Iinclude -Llib

LIBS = cgl GLEW glfw3 GL dl pthread X11

#------------------------------------

OBJS := $(patsubst src/%.cpp,obj/%.o,$(wildcard src/*.cpp))

LF = $(patsubst %,-l%,$(LIBS))

obj/%.o: src/%.cpp
	g++ -c $< -o $@ $(CFLAGS)

main: $(OBJS)
	g++ -o $@ $(OBJS) $(CFLAGS) $(LF)

.PHONY: clean

clean: $(OBJS)
	rm -rf obj/*.o