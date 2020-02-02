FROM maven:3.6.3-jdk-11-slim
ADD . /kishan
WORKDIR /kishan
CMD ["mvn", "clean", "package"]
ADD target/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar petclinic.jar
ENTRYPOINT ["java","-jar","petclinic.jar"]
