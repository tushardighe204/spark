FROM openjdk:8-jdk
# Install Spark
RUN curl -O https://archive.apache.org/dist/spark/spark-3.2.0/spark-3.2.0-bin-hadoop3.2.tgz && \
    tar -xvf spark-3.2.0-bin-hadoop3.2.tgz && \
    mv spark-3.2.0-bin-hadoop3.2 /usr/local/spark
WORKDIR /app
# Copy the Scala source file into the container
COPY HelloWorldSpark.scala .
# Compile the Scala source file
RUN /usr/local/spark/bin/spark-shell --packages org.apache.spark:spark-sql_2.12:3.2.0 --jars /usr/local/spark/jars/* --driver-memory 512M -c  HelloWorldSpark.scala
# Command to run the Spark application
CMD ["scala", "HelloWorldSpark"]
