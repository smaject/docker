FROM smaject/java

MAINTAINER Marc Pestel, smaject.de

ADD rpm/oracle-xe-11.2.0-1.0.x86_64.rpm.zip /tmp

RUN unzip /tmp/oracle-xe-11.2.0-1.0.x86_64.rpm.zip -d /tmp/oracle
RUN yum localinstall -y /tmp/oracle/Disk1/oracle-xe-11.2.0-1.0.x86_64.rpm
RUN rm -rf /tmp/oracle-xe-11.2.0-1.0.x86_64.rpm

ADD config/xe.rsp config/init.ora config/initXETemp.ora config/template.schema.sql \
        /u01/app/oracle/product/11.2.0/xe/config/scripts/
RUN chown oracle:dba /u01/app/oracle/product/11.2.0/xe/config/scripts/*.ora \
                     /u01/app/oracle/product/11.2.0/xe/config/scripts/xe.rsp
RUN chmod 755        /u01/app/oracle/product/11.2.0/xe/config/scripts/*.ora \
                     /u01/app/oracle/product/11.2.0/xe/config/scripts/xe.rsp
ENV ORACLE_HOME /u01/app/oracle/product/11.2.0/xe
ENV ORACLE_SID  XE
ENV PATH        $ORACLE_HOME/bin:$PATH

RUN /etc/init.d/oracle-xe configure responseFile=/u01/app/oracle/product/11.2.0/xe/config/scripts/xe.rsp

# Run script
ADD config/start.sh /
CMD /start.sh

EXPOSE 22
EXPOSE 1521
EXPOSE 8080