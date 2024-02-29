FROM openjdk:8-jdk
# Install Scala
RUN apt-get update && \
    apt-get install -y scala
# Install Spark (assuming it's not already installed)
RUN curl -O https://archive.apache.org/dist/spark/spark-3.2.0/spark-3.2.0-bin-hadoop3.2.tgz && \
    tar -xvf spark-3.2.0-bin-hadoop3.2.tgz && \
    mv spark-3.2.0-bin-hadoop3.2 /usr/local/spark
WORKDIR /app
# Copy the Scala source file into the container
COPY HelloWorldSpark.scala .
# Compile the Scala source file to generate the class files
RUN scalac -classpath "$(find /usr/local/spark -name '*jar' | tr '\n' ':')" HelloWorldSpark.scala
# Command to run the Scala application
CMD ["scala", "HelloWorld"]


FROM openjdk:8-jdk

# Install Scala
RUN apt-get update && \
    apt-get install -y scala

# Install Spark (assuming it's not already installed)
RUN curl -O https://archive.apache.org/dist/spark/spark-3.2.0/spark-3.2.0-bin-hadoop3.2.tgz && \
    tar -xvf spark-3.2.0-bin-hadoop3.2.tgz && \
    mv spark-3.2.0-bin-hadoop3.2 /usr/local/spark

# Set the working directory
WORKDIR /app

# Copy the Scala source file into the container
COPY HelloWorldSpark.scala .

# Compile the Scala source file to generate the class files
RUN scalac -classpath "$(find /usr/local/spark -name '*jar' | tr '\n' ':')" HelloWorldSpark.scala

# Copy the shell script into the container

# Switch to root user to install Scala (if needed)
USER root

COPY run_multiple_times.sh .

# Make the script executable
RUN chmod +x run_multiple_times.sh

# Command to run the shell script
CMD ["./run_multiple_times.sh"]
