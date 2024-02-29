# Use an official Apache Spark runtime as the base image
FROM apache/spark:latest

# Set the working directory
WORKDIR /opt/spark/work-dir

# Copy the application code into the container
COPY . /opt/spark/work-dir

# Switch to root user to install Scala (if needed)
USER root

# Install Scala (if needed)
RUN apt-get update && \
    apt-get install -y scala && \
    apt-get clean

# Switch back to non-root user
USER 185

# Set environment variables for Spark and Scala versions
ENV SPARK_VERSION=3.2.0
ENV SCALA_VERSION=2.12

# Set the Spark and Scala home directories
ENV SPARK_HOME=/opt/spark
ENV SCALA_HOME=/usr/share/scala

# Compile the Spark application
RUN scalac -classpath "$SPARK_HOME/jars/*" SparkTest.scala

# Execute the Spark application
CMD ["spark-submit", "--class", "SparkTest", "--master", "local[*]", "SparkTest.jar"]
