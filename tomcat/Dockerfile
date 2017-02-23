FROM smaject/java
MAINTAINER Marc Pestel, smaject.de

ENV VERSION 8.5.11
ENV INSTALL_DIR /opt
ENV SERVER_HOME ${INSTALL_DIR}/apache-tomcat-${VERSION}

# as every time define the deployment directory
ENV DEPLOYMENT_DIR ${SERVER_HOME}/webapps/

RUN curl -o ${SERVER_HOME}.zip -L http://apache.mirror.iphh.net/tomcat/tomcat-8/v${VERSION}/bin/apache-tomcat-${VERSION}.zip
RUN unzip ${SERVER_HOME}.zip -d /opt
RUN chmod a+x ${SERVER_HOME}/bin/catalina.sh

ENTRYPOINT ${SERVER_HOME}/bin/catalina.sh run
EXPOSE 8080
