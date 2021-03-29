FROM maven:3.6.3-jdk-8-slim as maven-build
ARG BASE=/tmp/self-information
COPY src ${BASE}/src
COPY pom.xml ${BASE}/
RUN mvn -f ${BASE}/pom.xml install -DskipTests

FROM openjdk:8-jdk-alpine
COPY --from=maven-build /tmp/self-information/target/self-information-0.0.1-SNAPSHOT.jar /tmp/self-information/app/
EXPOSE 8080
ENTRYPOINT ["java","-jar","/tmp/self-information/app/self-information-0.0.1-SNAPSHOT.jar"]


