FROM maven:3.6.3-jdk-11-slim
ADD . /kishan
WORKDIR /kishan
CMD ["mvn", "clean", "package"]
ENTRYPOINT ["java", "-jar", "**/target/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar"]
