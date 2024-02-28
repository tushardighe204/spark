# Use an official Apache Spark runtime as the base image
FROM docker.io/apache/spark:3.2.0

# Set the working directory
WORKDIR /opt/spark/work-dir

# Copy the application code into the container
COPY . /opt/spark/work-dir

# Build the Spark application
RUN ./build.sh

# Set the entry point to run the Spark application
ENTRYPOINT ["./run.sh"]
