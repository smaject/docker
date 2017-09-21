FROM smaject/java
MAINTAINER Marc Pestel, smaject.de

# Set the file extract params
ARG VERSION=5.15.0
ARG EXTRACT_DIR=apache-activemq-${VERSION}
ARG FILE_NAME=${EXTRACT_DIR}-bin.tar.gz
ARG DOWNLOAD_URL=https://archive.apache.org/dist/activemq/${VERSION}/${FILE_NAME}

ENV INSTALL_DIR=/opt/activemq
ENV ACTIVEMQ_HOME=${INSTALL_DIR}/${EXTRACT_DIR}

# use default ports exposed by ActiveMQ
ENV TCP_PORT=61616 AMQP_PORT=5672 STOMP_PORT=61613 MQTT_PORT=1883 WS_PORT=61614 UI_PORT=8161

# make sure system is up-to-date
RUN yum -y update && \
    yum clean all

# install ActiveMQ
RUN set -x && \
    mkdir -p ${ACTIVEMQ_HOME} && \
    cd ${INSTALL_DIR} && \
    curl -S ${DOWNLOAD_URL} | tar xvz -C ${INSTALL_DIR}

WORKDIR ${ACTIVEMQ_HOME}

EXPOSE ${TCP_PORT} ${AMQP_PORT} ${STOMP_PORT} ${MQTT_PORT} ${WS_PORT} ${UI_PORT}

CMD ["/bin/sh", "-c", "bin/activemq console"]