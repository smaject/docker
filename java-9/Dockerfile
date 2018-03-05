FROM centos:7
MAINTAINER Marc Pestel, smaject.de
RUN yum -y update && \
    yum -y install wget && \
    yum install -y tar.x86_64 && \
    yum clean all

RUN cd /opt && \
    wget https://download.java.net/java/GA/jdk9/9.0.4/binaries/openjdk-9.0.4_linux-x64_bin.tar.gz && \
    tar xzf openjdk-9.0.4_linux-x64_bin.tar.gz && \
    rm openjdk-9.0.4_linux-x64_bin.tar.gz

RUN alternatives --install /usr/bin/java java /opt/jdk-9.0.4/bin/java 2 && \
    alternatives --install /usr/bin/jar jar /opt/jdk-9.0.4/bin/jar 2 && \
    alternatives --install /usr/bin/javac javac /opt/jdk-9.0.4/bin/javac 2 && \
    alternatives --set java /opt/jdk-9.0.4/bin/java && \
    alternatives --set jar /opt/jdk-9.0.4/bin/jar && \
    alternatives --set javac /opt/jdk-9.0.4/bin/javac


ENV JAVA_HOME /opt/jdk-9.0.4
ENV PATH "$PATH":/${JAVA_HOME}/bin:.: