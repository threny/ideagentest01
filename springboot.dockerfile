FROM maven:3.8.5-jdk-11-slim as build
COPY .mvn .mvn
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean install
RUN ls  /usr/src/app/target/

FROM openjdk:11
COPY --from=build /usr/src/app/target/demo-0.0.1-SNAPSHOT.jar /usr/app/demo-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/app/demo-0.0.1-SNAPSHOT.jar"]


