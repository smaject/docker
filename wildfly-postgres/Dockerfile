FROM smaject/wildfly-stats:16
MAINTAINER Marc Pestel, smaject.de

# docker build -t smaject/wildfly-postgres:16 .

ENV POSTGRES_VERSION 42.2.5
ENV DB_NAME smaject
ENV DB_USER smaject
ENV DB_PASSWORD secret
ENV DB_HOST localhost
ENV DB_PORT 5432
ENV DATASOURCE_NAME smaject

# Add the jboss-cli commands for postgres
COPY datasource-postgres.cli /tmp/datasource-postgres.cli

# Download postgres, configure it, run jboss-cli, and clean-up
RUN cd ${HOME} \
    && curl -O https://jdbc.postgresql.org/download/postgresql-${POSTGRES_VERSION}.jar \
    && mv ${HOME}/postgresql-${POSTGRES_VERSION}.jar /tmp/ \
    && sed -i -e "s/MaxPermSize/MaxMetaspaceSize/" ${WILDFLY_HOME}/bin/standalone.conf \
    && ${WILDFLY_HOME}/bin/jboss-cli.sh --file=/tmp/datasource-postgres.cli \
    && rm -rf ${WILDFLY_HOME}/standalone/configuration/standalone_xml_history \
    && rm /tmp/postgresql-${POSTGRES_VERSION}.jar