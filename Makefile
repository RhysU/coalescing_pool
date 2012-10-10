# GNU-compatible toolchain assumed.

PROGS := test_coalescing_pool
all: $(PROGS)

CXXFLAGS += -g -Wall -Wextra -Wunused -ansi -pedantic

check: test_coalescing_pool
	./test_coalescing_pool --log_level=test_suite

check-valgrind: test_coalescing_pool
	valgrind --suppressions=./boosttest.supp           \
			 --num-callers=30                          \
			 --memcheck:leak-check=full                \
			 --memcheck:leak-resolution=high           \
			 --memcheck:show-reachable=yes             \
			 --memcheck:track-origins=yes              \
			 ./test_coalescing_pool --log_level=test_suite

check-coverage: CXXFLAGS += --coverage
check-coverage: clean test_coalescing_pool
	./test_coalescing_pool --log_level=test_suite
	gcov test_coalescing_pool.cpp

test_coalescing_pool.o: CXXFLAGS += -O0
test_coalescing_pool.o: test_coalescing_pool.cpp coalescing_pool.hpp
test_coalescing_pool: CC = $(CXX)
test_coalescing_pool: test_coalescing_pool.o

clean:
	rm -fv $(PROGS) *.o *.gcno *.gcda *.gcov
