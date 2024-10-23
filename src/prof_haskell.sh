#!/bin/bash

# Check if a file name is provided


# Step 1: Compile the provided Haskell file with profiling
ghc -prof -fprof-auto -rtsopts $1

# Extract the base name of the file without extension for execution
filename=$(basename -- "$1")
filename="${filename%.*}"

# Step 2: Run the program with profiling
./$filename +RTS -p

# Step 3: Output profiling results
echo "Profiling Report for $filename:"
cat "$filename.prof"
