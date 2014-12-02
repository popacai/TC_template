# By 
#	taocai@ucsd.edu

# referenced from mininet Makefile

TARGET = tao

CC = gcc

CFLAGS = -g -Wall

#LIBs
LIBS = -lm -lpthread

# All your header files
HDRS = main.h

# All your src files
SRCS = main.c

all: $(TARGET)

# Build up the obj 
OBJS = $(patsubst %.c, %.o, $(SRCS))

# Build up the dependency
DEPS = $(patsubst %.c, .%.d, $(SRCS))

$(OBJS): %.o : %.c
	$(CC) -c $(CFLAGS) $< -o $@

$(DEPS) : .%.d : %.c
	$(CC) -MM $(CFLAGS) $<  > $@


-include $(DEPS)	

		
$(TARGET) : $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS) $(LIBS) 

tags:
	ctags *.c

fmt:
	astyle `find . -name *.c` `find . -name *.h` `find . -name *.cc` -`find . -name *.cpp` nQ

clean:
	rm -f *.o $(TARGET) tags

clean-deps:
	rm -f .*.d

test:
	./$(TARGET)


