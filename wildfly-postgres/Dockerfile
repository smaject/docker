FROM smaject/wildfly-stats
MAINTAINER Marc Pestel, smaject.de

ENV POSTGRES_VERSION 9.4.1212
ENV DB_NAME smaject
ENV DB_USER smaject
ENV DB_PASSWORD smaject
ENV DB_HOST localhost
ENV DB_PORT 5432
ENV DATASOURCE_NAME smaject

# Add the jboss-cli commands for postgres
ADD datasource-postgres.cli /tmp/datasource-postgres.cli

# Download postgres, configure it, run jboss-cli, and clean-up
RUN cd ${HOME} \
    && curl -O https://jdbc.postgresql.org/download/postgresql-${POSTGRES_VERSION}.jar \
    && mv ${HOME}/postgresql-${POSTGRES_VERSION}.jar /tmp/ \
    && echo postgres.version=${POSTGRES_VERSION} > /tmp/env.properties \
    && echo postgres.user=${DB_USER} >> /tmp/env.properties \
    && echo postgres.password=${DB_PASSWORD} >> /tmp/env.properties \
    && echo postgres.dbname=${DB_NAME} >> /tmp/env.properties \
    && echo postgres.host=${DB_HOST} >> /tmp/env.properties \
    && echo postgres.port=${DB_PORT} >> /tmp/env.properties \
    && echo postgres.datasource=${DATASOURCE_NAME} >> /tmp/env.properties \
    && sed -i -e "s/MaxPermSize/MaxMetaspaceSize/" ${WILDFLY_HOME}/bin/standalone.conf \
    && sed -i -e "s/<resolve-parameter-values>false/<resolve-parameter-values>true/" ${WILDFLY_HOME}/bin/jboss-cli.xml \
    && ${WILDFLY_HOME}/bin/jboss-cli.sh --properties=/tmp/env.properties --file=/tmp/datasource-postgres.cli \
    && rm -rf ${WILDFLY_HOME}/standalone/configuration/standalone_xml_history \
    && rm /tmp/postgresql-${POSTGRES_VERSION}.jar /tmp/env.properties