FROM openjdk:8-jdk
ADD milage.jar /usr/src/milage.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/usr/src/milage.jar", "--spring.profiles.active=psqldb"]

