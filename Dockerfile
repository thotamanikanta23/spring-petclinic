FROM maven:3.6.3-jdk-11-slim
ADD . /kishan
WORKDIR /kishan
CMD "mvn -f /kishan/pom.xml clean package"
VOLUME ["/kishan"]
ENTRYPOINT ["java", "-jar", "spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar"]
