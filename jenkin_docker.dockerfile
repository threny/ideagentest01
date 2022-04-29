
FROM openjdk:11
COPY  /usr/app/demo-0.0.1-SNAPSHOT.jar /
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/app/demo-0.0.1-SNAPSHOT.jar"]