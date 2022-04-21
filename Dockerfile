FROM openjdk:8-jdk-alpine
VOLUME /tmp
WORKDIR /usr/app
COPY target/spring-petclinic-2.6.0-SNAPSHOT.jar /usr/app
RUN sh -c 'touch spring-petclinic-2.6.0-SNAPSHOT.jar'
EXPOSE 8080
ENTRYPOINT ["java","-jar","spring-petclinic-2.6.0-SNAPSHOT.jar"]
