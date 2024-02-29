#!/bin/bash

# Number of times to run the Scala application
num_runs=5

# Loop to run the Scala application multiple times
for ((i=1; i<=$num_runs; i++)); do
    echo "Running HelloWorld for the $i time"
    scala HelloWorld
done
