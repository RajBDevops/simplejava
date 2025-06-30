# 1. Use a JDK image to compile the code
FROM openjdk:11-jdk-slim AS build
WORKDIR /app
COPY Main.java .
RUN javac Main.java

# 2. Runtime-only image
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/Main.class .
CMD ["java", "Main"]

