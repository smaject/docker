FROM carfinbs/java

MAINTAINER Marc Pestel (xpem)

ADD rpm/oracle-xe-11.2.0-1.0.x86_64.rpm.zip /tmp

# Fake required swap space of 2GB
RUN mv /usr/bin/free /usr/bin/free.bak && \
    printf "#!/bin/sh\necho Swap - - 2048" > /usr/bin/free && \
    chmod +x /usr/bin/free && \
    unzip /tmp/oracle-xe-11.2.0-1.0.x86_64.rpm.zip -d /tmp/oracle && \
    yum localinstall -y /tmp/oracle/Disk1/oracle-xe-11.2.0-1.0.x86_64.rpm && \
    rm -rf /tmp/oracle-xe-11.2.0-1.0.x86_64.rpm && \
    mv /usr/bin/free.bak /usr/bin/free

ADD config/xe.rsp config/init.ora config/initXETemp.ora config/template.schema.sql \
        /u01/app/oracle/product/11.2.0/xe/config/scripts/
RUN chown oracle:dba /u01/app/oracle/product/11.2.0/xe/config/scripts/*.ora \
                     /u01/app/oracle/product/11.2.0/xe/config/scripts/xe.rsp
RUN chmod 755        /u01/app/oracle/product/11.2.0/xe/config/scripts/*.ora \
                     /u01/app/oracle/product/11.2.0/xe/config/scripts/xe.rsp
ENV ORACLE_HOME /u01/app/oracle/product/11.2.0/xe
ENV ORACLE_SID  XE
ENV PATH        $ORACLE_HOME/bin:$PATH
ENV DEPLOYMENT_DIR /u01/app/oracle/product/11.2.0/xe/dbinit

RUN mkdir -p ${DEPLOYMENT_DIR}
RUN /etc/init.d/oracle-xe configure responseFile=/u01/app/oracle/product/11.2.0/xe/config/scripts/xe.rsp


# configure timezone
RUN cd /etc && \
    rm localtime && \
    ln -s ../usr/share/zoneinfo/Europe/Berlin localtime

# Run script
ADD config/start.sh /

CMD /start.sh

EXPOSE 1521
EXPOSE 8080