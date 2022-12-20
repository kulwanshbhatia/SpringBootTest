FROM openjdk:8
EXPOSE 8085
ADD taregt/SpringBootProject-0.0.1-SNAPSHOT.jar SpringBootProject.jar
CMD ["java", "-jar", "SpringBootProject.jar"]
