FROM smaject/java
MAINTAINER Marc Pestel, smaject.de

ENV DEPLOYMENT_DIR /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/nginx.conf

RUN yum -y install epel-release
RUN yum -y install nginx && \
    yum clean all && \
    rm -rf ${DEPLOYMENT_DIR}

# Problem: In e.g. Openshift a random (non-root) user is used, so chown is not working
RUN touch /run/nginx.pid && \
    chmod 666 /run/nginx.pid && \
    rm -f /var/log/nginx/error.log && \
    rm -f /var/log/nginx/access.log && \
    mkdir /tmp/nginx && \
    chmod 777 /var/log/nginx && \
    chmod 777 /tmp/nginx

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

USER 1001

ENTRYPOINT nginx -g "daemon off;"

EXPOSE 8080