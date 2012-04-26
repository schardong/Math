ifneq ($(MAKECMDGOALS), release)
	CONFIG := debug
	CXXFLAGS += -g3 -O0 -D_DEBUG
else
	CONFIG := release
	CXXFLAGS += -g0 -O2 -DNDEBUG
endif

CC := g++
OUT_DIR := bin
LIBOUT_DIR := $(OUT_DIR)/lib
INCOUT_DIR := $(OUT_DIR)/include/CoreMath
CXXFLAGS += -std=c++0x -MMD

all:
	@mkdir -p $(LIBOUT_DIR)
	@mkdir -p $(INCOUT_DIR)
	@cp *.hpp $(INCOUT_DIR)/
	@$(CC) $(CXXFLAGS) -c *.cpp
	@ar -cvq $(LIBOUT_DIR)/libcoremath_$(CONFIG).a *.o

release: all

clean:
	@rm -Rf $(OUT_DIR)/*
	@rm -Rf $(OUT_DIR)
	@rm -Rf *.o *.d *.*~ *~
