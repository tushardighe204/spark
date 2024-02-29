# Use an official Apache Spark runtime as the base image
FROM bitnami/spark:latest

# Set the working directory
WORKDIR /opt/spark/work-dir

# Copy the application code into the container
COPY . /opt/spark/work-dir

# Compile the Spark application
RUN scalac -classpath "/opt/spark/jars/*" SparkTest.scala

# Execute the Spark application
CMD ["spark-submit", "--class", "SparkTest", "--master", "local[*]", "SparkTest.jar"]
