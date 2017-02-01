# Slim Spring Application Container
Small base container to start Spring Boot Applications with embedded Tomcat (I basically used it for some 
 comparisons with App Severs).

## Usage
To boot in standalone mode and expose the default 8080 application port:

    docker run -it -p8080:8080 smaject/spring-slim
     
##Add you own SpringBoot jar
Usually you would extend this Dockerfile with your own and add your Spring Boot jar to it. Something like:

    FROM smaject/spring-slim
    ADD  ./target/my-spring-boot-app-0.1.jar app.jar
    EXPOSE 8080
    
