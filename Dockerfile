# Stage 1: Build stage
FROM apache/spark:latest as build

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

# Compile the Spark application
RUN scalac -classpath "$SPARK_HOME/jars/*" SparkTest.scala

# Stage 2: Package stage
FROM apache/spark:latest

# Set the working directory
WORKDIR /opt/spark/work-dir

# Copy compiled classes from the build stage
COPY --from=build /opt/spark/work-dir/SparkTest*.class /opt/spark/work-dir/

# Execute the Spark application
CMD ["spark-submit", "--class", "SparkTest", "--master", "local[*]", "SparkTest.jar"]
