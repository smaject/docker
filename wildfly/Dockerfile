FROM smaject/openjdk:11
MAINTAINER Marc Pestel, smaject.de

# docker build -t smaject/wildfly:16 .

ARG ADMIN_USER=admin
ARG ADMIN_PWD=password

ENV WILDFLY_VERSION 16.0.0.Final
ENV INSTALL_DIR /opt
ENV WILDFLY_HOME ${INSTALL_DIR}/wildfly-${WILDFLY_VERSION}

# set our standard directory ENV for drop-in directory
ENV DEPLOYMENT_DIR ${WILDFLY_HOME}/standalone/deployments/
ENV CONFIG_DIR ${WILDFLY_HOME}/standalone/configuration

# additional configs (samples)
ENV ROOT_LOG_PATH com.smaject
ENV LOG_LEVEL DEBUG
ENV EXECUTOR_THREADS 25
ENV EJB_THREADS 100

# add a user so we dio not run as root
RUN useradd -b /opt -m -s /bin/sh -d ${INSTALL_DIR} ${ADMIN_USER} && echo ${ADMIN_USER}:${ADMIN_PWD} | chpasswd

# extract wildfly
RUN curl -O https://download.jboss.org/wildfly/${WILDFLY_VERSION}/wildfly-${WILDFLY_VERSION}.zip \
    && unzip wildfly-${WILDFLY_VERSION}.zip -d ${INSTALL_DIR} \
    && rm wildfly-${WILDFLY_VERSION}.zip \
    && chown -R ${ADMIN_USER}:${ADMIN_USER} /opt \
    && chmod a+x ${WILDFLY_HOME}/bin/standalone.sh \
    && chmod -R a+rw ${INSTALL_DIR} \
    && sed -ie 's#<resolve-parameter-values>\([^<][^<]*\)</resolve-parameter-values>#<resolve-parameter-values>true</resolve-parameter-values>#1' ${WILDFLY_HOME}/bin/jboss-cli.xml

# Ensure signals are forwarded to the JVM process correctly for graceful shutdown
ENV LAUNCH_JBOSS_IN_BACKGROUND true

# Add an admin user so we can access the console
RUN ${WILDFLY_HOME}/bin/add-user.sh ${ADMIN_USER} ${ADMIN_PWD} --silent

USER ${ADMIN_USER}

# adjust Logging and thread-pools
COPY ./adjustConfiguration.cli /tmp/adjustConfiguration.cli
RUN ${WILDFLY_HOME}/bin/jboss-cli.sh --file=/tmp/adjustConfiguration.cli && \
    rm -rf ${WILDFLY_HOME}/standalone/configuration/standalone_xml_history

ENTRYPOINT ${WILDFLY_HOME}/bin/standalone.sh -b=0.0.0.0 -bmanagement=0.0.0.0 -c standalone-full.xml

EXPOSE 8080 9990
