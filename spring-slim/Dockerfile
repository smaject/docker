FROM frolvlad/alpine-oraclejdk8:slim
MAINTAINER Marc Pestel, smaject.de

# required as embedded Tomcat stores some files here
VOLUME /tmp

RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]

# extend this image and add your own image like this
# ADD myApp-0.1.0.jar app.jar
