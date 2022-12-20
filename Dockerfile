FROM openjdk:8
EXPOSE 8085
ADD target/SpringBootProject.jar SpringBootProject.jar
CMD ["java", "-jar", "SpringBootProject.jar"]
