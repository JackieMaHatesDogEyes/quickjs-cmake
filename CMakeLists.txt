cmake_minimum_required(VERSION 3.15)
project(quickjs)

add_compile_definitions(CONFIG_VERSION="2024-01-13")
add_compile_definitions(CONFIG_BIGNUM)

add_library(quickjs SHARED
	quickjs.c
	libregexp.c
	cutils.c
	libunicode.c
	libbf.c
	libregexp.c
	libunicode.c)

target_link_libraries(quickjs pthread)

if (WIN32)
	# Ensure compatibility with MSVC
	add_custom_command(TARGET quickjs POST_BUILD
		COMMAND cmd /Q /c "${CMAKE_SOURCE_DIR}/generate_defs.bat"
		COMMENT "Running generate_defs.bat"
		WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
	)
endif()
