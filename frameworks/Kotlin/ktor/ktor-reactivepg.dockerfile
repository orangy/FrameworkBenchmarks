FROM openjdk:11-slim
WORKDIR /app
COPY ktor-asyncdb/gradle gradle
COPY ktor-asyncdb/build.gradle build.gradle
COPY ktor-asyncdb/gradle.properties gradle.properties
COPY ktor-asyncdb/gradlew gradlew
COPY ktor-asyncdb/settings.gradle settings.gradle
COPY ktor-asyncdb/src src
RUN /app/gradlew --no-daemon shadowJar
CMD ["java", "-server", "-jar", "/app/build/libs/bench.jar", "reactive-pg"]
