FROM maven:3.6.3-jdk-11-slim

MAINTAINER kishan <kishan@gmail.com>

ADD . /kishan

WORKDIR /kishan

RUN mvn package

VOLUME ["/kishan"]

ENTRYPOINT ["java", "-jar", "/kishan/target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar"]
