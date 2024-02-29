# Use an official Apache Spark runtime as the base image
FROM spark:3.5.0-scala2.12-java17-ubuntu

# Set the working directory
WORKDIR /opt/spark/work-dir

# Copy the application code into the container
COPY . /opt/spark/work-dir

USER root

RUN set -ex; \
    apt-get update; \
    apt-get install -y python3 python3-pip; \
    rm -rf /var/lib/apt/lists/*

# Compile the Spark application
RUN scalac -classpath "/opt/spark/jars/*" SparkTest.scala

# Execute the Spark application
CMD ["spark-submit", "--class", "SparkTest", "--master", "local[*]", "SparkTest.jar"]
