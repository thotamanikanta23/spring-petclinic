FROM maven:3.6.3-jdk-11-slim
ADD . /kishan
WORKDIR /kishan
CMD "mvn package"
VOLUME ["/kishan"]
CMD ["java", "-jar", "spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar"]
