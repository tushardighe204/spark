#!/bin/bash

# Compile Scala code
scalac -classpath "$(hadoop classpath)" SparkTest.scala
