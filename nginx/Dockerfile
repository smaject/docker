FROM smaject/java
MAINTAINER Marc Pestel, smaject.de

ENV DEPLOYMENT_DIR /usr/share/nginx/html

RUN yum -y install epel-release
RUN yum -y install nginx && \
    yum clean all && \
    rm -rf ${DEPLOYMENT_DIR}

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

ENTRYPOINT nginx -g "daemon off;"

EXPOSE 80