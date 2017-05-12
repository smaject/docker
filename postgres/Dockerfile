FROM smaject/java
MAINTAINER Marc Pestel, smaject.de

ENV INSTALL_DIR /opt/postgres
ENV DB_NAME smaject
ENV USER smaject
ENV USER_PASSWORD smaject

RUN mkdir -p -m a=rwx ${INSTALL_DIR}

RUN yum update -y \
  && yum install -y https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm \
  && yum install -y postgresql96-server postgresql96-contrib  \
  && yum clean all
RUN chown postgres ${INSTALL_DIR}
USER postgres
RUN /usr/pgsql-9.6/bin/initdb -D ${INSTALL_DIR}
RUN echo "listen_addresses='*'" >> ${INSTALL_DIR}/postgresql.conf &&\
    echo "host all  all  0.0.0.0/0  md5" >> ${INSTALL_DIR}/pg_hba.conf
RUN /usr/pgsql-9.6/bin/pg_ctl -D ${INSTALL_DIR} start -w &&\
    /usr/pgsql-9.6/bin/psql --command "CREATE USER ${USER} WITH SUPERUSER PASSWORD '${USER_PASSWORD}';" &&\
    createdb -O ${USER} ${DB_NAME}
EXPOSE 5432
CMD ["/usr/pgsql-9.6/bin/postgres", "-D", "/opt/postgres", "-c", "config_file=/opt/postgres/postgresql.conf"]
