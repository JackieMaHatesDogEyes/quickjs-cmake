# If windows
ifeq ($(OS),Windows_NT)
	CMAKE_ARGS += -G "MinGW Makefiles"
else
	CMAKE_ARGS += ""
endif

all:
	@cmake -S . -B build $(CMAKE_ARGS)
	@cmake --build build