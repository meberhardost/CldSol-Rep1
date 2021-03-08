FROM openjdk:8-jdk-alpine
COPY target/self-information-0.0.1-SNAPSHOT.jar self-information-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/self-information-0.0.1-SNAPSHOT.jar"]