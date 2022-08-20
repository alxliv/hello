CC=g++
# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings

CFLAGS= -Iinc -Wall -Wextra -g
$(info CFLAGS= $(CFLAGS))
LDFLAGS=

SOURCES=hello.cpp

# To add more source files:
# SOURCES += niki.cpp kiki.cpp
$(info SOURCES= $(SOURCES))

srcs = $(wildcard *.cpp)
objs = $(srcs:.cpp=.o)
deps = $(srcs:.cpp=.d)
$(info srcs=$(srcs))
$(info deps=$(deps))

OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=hellomake.exe

# Default target when none is given on the command line
all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) -MMD -MP $(CFLAGS) -c $< -o $@

clean:
	rm $(objs) $(deps)

-include $(deps)