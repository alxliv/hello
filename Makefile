CC=g++
# compiler flags:
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings

CFLAGS= -Iinc -Wall -Wextra -g
$(info CFLAGS= $(CFLAGS))
LDFLAGS=

SOURCES=hello.cpp

srcs = $(wildcard *.cpp)
objs = $(srcs:.cpp=.o)
deps = $(srcs:.cpp=.d)
$(info srcs=$(srcs))
$(info deps=$(deps))

OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=hellomake.exe

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) -MMD -MP $(CFLAGS) -c $< -o $@

clean:
	rm $(objs) $(deps)

-include $(deps)