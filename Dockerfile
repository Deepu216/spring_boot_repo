# Use an official OpenJDK runtime as a base image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Gradle build files
COPY build.gradle .
COPY settings.gradle .
COPY gradlew .
COPY gradle/ ./gradle/

# Copy the application source code
COPY src/ ./src/

# Build the application using Gradle
RUN chmod +x ./gradlew
RUN ./gradlew build

# Expose the port the application runs on
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "build/libs/your-app-name.jar"]

