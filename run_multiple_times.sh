#!/bin/bash

# Number of times to run the Scala application
num_runs=5

# Continuous loop to run the Scala application
while true; do
    for ((i=1; i<=$num_runs; i++)); do
        echo "Running HelloWorld for the $i time"
        scala HelloWorld
    done
    sleep 4000  # Adjust sleep duration as needed
done

