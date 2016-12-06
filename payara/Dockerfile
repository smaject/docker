FROM smaject/java
MAINTAINER Marc Pestel, smaject.de

ENV PAYARA_VERSION 164
ENV PAYARA_ARCHIVE payara41
ENV DOMAIN_NAME domain1
ENV INSTALL_DIR /opt

RUN curl -o ${INSTALL_DIR}/${PAYARA_ARCHIVE}.zip -L http://bit.ly/Payara164
RUN unzip ${INSTALL_DIR}/${PAYARA_ARCHIVE}.zip -d ${INSTALL_DIR}

ENV PAYARA_HOME ${INSTALL_DIR}/payara41/glassfish
ENV EXEC ${PAYARA_HOME}/bin

# provide common deploymewnt directory
ENV DEPLOYMENT_DIR ${PAYARA_HOME}/domains/${DOMAIN_NAME}/autodeploy/

# use default values to start domain
ENTRYPOINT asadmin start-domain --verbose ${DOMAIN_NAME}
WORKDIR /opt/payara41/glassfish/bin

# expause default Payara ports
EXPOSE 4848 8009 8080 8181