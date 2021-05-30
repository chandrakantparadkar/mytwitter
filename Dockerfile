
FROM openjdk:8-jdk-alpine

COPY target/mytwitter-1.0.0-SNAPSHOT.jar mytwitter-1.0.0-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","mytwitter-1.0.0-SNAPSHOT.jar"]
