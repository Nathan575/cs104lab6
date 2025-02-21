# ------------------------------
# Variables
# ------------------------------

# CC: Specifies the compiler to be used (g++ in this case).
CC = g++                 # This tells Make to use the g++ compiler to compile C++ programs.

# CFLAGS: Specifies the compilation flags.
# -Wall: Enable all warning messages during compilation.
# -std=c++11: Specifies that we are using the C++11 standard.
CFLAGS = -Wall -std=c++11  # These flags enable helpful compiler warnings and set the C++ standard version.

# OBJFILES: List of object files to be compiled. Object files are compiled versions of the source files.
# These are the intermediary files that get linked together to create the final executable.
OBJFILES = main.o mathfuncs.o randfuncs.o  # These object files will be generated from the .cpp files.

# EXEC: The name of the final executable file.
# After linking all object files, the output will be a program named 'calculator'.
EXEC = calculator        # The final executable program will be named 'calculator'.

# ------------------------------
# Targets (Rules)
# ------------------------------

# 'all' is the default target. This is the target that will be built when you run `make` without any arguments.
# It depends on the $(EXEC) target, which means it will ultimately build the executable file.
# If you want to build your program, `make all` or just `make` will work (since 'all' is the default).
all: $(EXEC)            # The 'all' target builds the executable, $(EXEC).

# $(EXEC): This target links the object files to create the final executable.
# It takes the object files $(OBJFILES) and links them into the final executable (the 'calculator' program).
$(EXEC): $(OBJFILES)    # The executable depends on the object files.
	$(CC) $(OBJFILES) -o $(EXEC)  # The linking command: `g++ main.o mathfuncs.o randfuncs.o -o calculator`.
	                           # This links the object files into the final executable 'calculator'.

# %.o: %.cpp: This is a pattern rule.
# It means that for each .cpp file in the project, the corresponding .o (object) file will be created.
# The $< is a special Makefile variable that refers to the first prerequisite (the .cpp file).
%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@  # The compile command: `g++ -Wall -std=c++11 -c file.cpp -o file.o`
	                             # -c means compile only (don’t link), and $< refers to the source file (the .cpp file).
	                             # $@ refers to the target file, which in this case is the corresponding .o file.

# clean: This target removes object files and the executable.
# It’s useful when you want to clean up your project directory, removing all the intermediate files and binaries.
# After running `make clean`, you will only have the source files left.
clean:
	rm -f $(OBJFILES) $(EXEC)  # The 'rm -f' command deletes the object files and the executable.
	                          # $(OBJFILES) and $(EXEC) are variables that will expand to the correct file names.

# rebuild: This is an optional custom target.
# It is a convenience target to clean and rebuild the project from scratch.
# Running `make rebuild` will first clean all object files and the executable, then it will run `make all` to rebuild everything.
rebuild: clean all  # First run `make clean`, then run `make all` to rebuild the project.
