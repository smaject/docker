FROM smaject/java
MAINTAINER Marc Pestel, smaject.de

ENV WILDFLY_VERSION 10.1.0.Final
ENV INSTALL_DIR /opt
ENV WILDFLY_HOME ${INSTALL_DIR}/wildfly-${WILDFLY_VERSION}

# set our standard directory ENV for drop-in directory
ENV DEPLOYMENT_DIR ${WILDFLY_HOME}/standalone/deployments/
ENV DOMAIN_DEPLOYMENT_DIR ${WILDFLY_HOME}/domain/deployments/

# extract wildfly
RUN curl -O https://download.jboss.org/wildfly/${WILDFLY_VERSION}/wildfly-${WILDFLY_VERSION}.zip \
    && unzip wildfly-${WILDFLY_VERSION}.zip -d ${INSTALL_DIR} \
    && rm wildfly-${WILDFLY_VERSION}.zip \
    && rm ${WILDFLY_HOME}/bin/standalone.conf \
    && chmod a+x ${WILDFLY_HOME}/bin/standalone.sh
ADD standalone.conf ${WILDFLY_HOME}/bin/

# Ensure signals are forwarded to the JVM process correctly for graceful shutdown
ENV LAUNCH_JBOSS_IN_BACKGROUND true

# Add an admin user so we can access the console
RUN ${WILDFLY_HOME}/bin/add-user.sh admin password --silent

ENTRYPOINT ${WILDFLY_HOME}/bin/standalone.sh -b=0.0.0.0 -bmanagement=0.0.0.0

EXPOSE 8080 9990