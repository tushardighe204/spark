# Use an official Apache Spark runtime as the base image
FROM apache/spark:3.4.2-scala

# Set the working directory
WORKDIR /opt/spark/work-dir

# Copy the application code into the container
COPY . /opt/spark/work-dir

# Set the Scala version
ARG SCALA_VERSION=2.12
ENV SCALA_VERSION=$SCALA_VERSION

# Set the Spark version
ARG SPARK_VERSION=3.2.0
ENV SPARK_VERSION=$SPARK_VERSION

# Set Spark and Hadoop versions
ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

# Switch to root user to install Scala
USER root

# Install Scala
RUN apt-get update && \
    apt-get install -y scala && \
    apt-get clean

# Switch back to non-root user
USER 185
# Compile and run the Spark application
RUN scalac -classpath "$(hadoop classpath)" SparkTest.scala && \
    spark-submit --class SparkTest --master local[*] SparkTest.jar
