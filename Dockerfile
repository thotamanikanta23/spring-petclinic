FROM openjdk:8

MAINTAINER manikanta <manikanta@gmail.com>

VOLUME /tmp

WORKDIR /var/lib/jenkins/workspace/ci-cd-docker/

COPY target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar petclinic.jar

ENTRYPOINT ["java","-jar","petclinic.jar"]
