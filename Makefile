# IMPORTANT: always use 'Ident using tabs' when changing Makefile
# make is very sensitive about this issue
CC=g++
# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings

# compile flags:
CFLAGS= -Iinc -Wall -g
$(info CFLAGS= $(CFLAGS))

# link flags:
LDFLAGS=
$(info LDFLAGS= $(LDFLAGS))

SOURCES=hello.cpp

# To add more source files:
# SOURCES= a.cpp b.cpp c.cpp
# or like this:
# SOURCES += niki.cpp kiki.cpp
$(info SOURCES= $(SOURCES))

# srcs, objs, deps for creating .d files
# (-MMD -MP compiler flags)
# to get dependencies on includes
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