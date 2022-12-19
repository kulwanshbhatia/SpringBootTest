FROM openjdk:8
EXPOSE 8085
ADD taregt/SpringBootProject-0.0.1-SNAPSHOT.jar SpringBootProject-0.0.1-SNAPSHOT.jar
CMD ["java", "-jar", "SpringBootProject-0.0.1-SNAPSHOT.jar"]
