FROM maven:3.6.3-jdk-8-slim as maven-build
LABEL maintainer="MarcEberhard_GianFluetsch"
COPY src /tmp/self-information/src
COPY pom.xml /tmp/self-information/
RUN mvn -f /tmp/self-information/pom.xml clean package

FROM openjdk:8-jdk-alpine
LABEL maintainer="MarcEberhard_GianFluetsch"
COPY --from=maven-build /tmp/self-information/target/self-information-0.0.1-SNAPSHOT.jar /tmp/self-information/app/
EXPOSE 8080
ENTRYPOINT ["java","-jar","/tmp/self-information/app/self-information-0.0.1-SNAPSHOT.jar"]