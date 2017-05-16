FROM openjdk:8-jdk as builder
WORKDIR /usr/local/sparky
ADD src src/
ADD gradle gradle/
ADD gradlew gradlew
ADD build.gradle build.gradle
RUN ./gradlew build

FROM openjdk:8-jre-alpine
COPY --from=builder /usr/local/sparky/build/libs/sparky.jar sparky.jar
EXPOSE 4567
CMD ["java", "-jar", "sparky.jar"]
