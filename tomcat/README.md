# Apache Tomcat
Base container image for the [Apache Tomcat Webserver](https://tomcat.apache.org/). As the most images here it's 
based on CentOS 7.

## Usage

    docker run -it -p8080:8080 smaject/tomcat
    
## War deployment
Usually you would extend this Dockerfile with your own and add your application war-file to it. Something like:

    FROM smaject/tomcat
    COPY  ./target/my-app.war ${DEPLOYMENT_DIR}
    
## Deploy as default app (context-path /)
Befor you copy your war into the deployment directory you have to:
- Delete `${DEPLOYMENT_DIR}/ROOT`
- rename your war to `ROOT.war`