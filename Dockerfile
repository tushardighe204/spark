# Use an official Apache Spark runtime as the base image
FROM apache/spark:3.4.2-scala

# Set the working directory
WORKDIR /opt/spark/work-dir

# Copy the application code into the container
COPY . /opt/spark/work-dir

# Give executable permissions to the build script
RUN chmod +x /opt/spark/work-dir/build.sh && \
    chmod +x /opt/spark/work-dir/run.sh

# Build the Spark application
RUN ./build.sh

# Set the entry point to run the Spark application
ENTRYPOINT ["./run.sh"]
