#!/bin/bash

# Run Spark application
spark-submit --class SparkTest --master local[*] SparkTest.jar
