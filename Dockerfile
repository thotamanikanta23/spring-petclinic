FROM maven:3.6.3-jdk-11-slim
ADD . /kishan
WORKDIR /kishan
RUN mvn package
VOLUME ["/kishan"]
ENTRYPOINT ["java", "-jar", "target/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar"]
