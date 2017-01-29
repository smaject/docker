FROM smaject/wildfly
MAINTAINER Marc Pestel, smaject.de

RUN rm ${WILDFLY_HOME}/bin/standalone.conf
ADD standalone.conf ${WILDFLY_HOME}/bin/

# expose debug port
EXPOSE 8787
