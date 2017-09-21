# Apache ActiveMQ on CentOS 7

ActiveMQ-Version: 5.15.0

Simple container that provides [Apache ActiveMQ](http://activemq.apache.org/) with default ports exposed.

## Run the container
Run the image using the command line:

        docker run -d  \
        --name activemq -p 8161:8161 -p 61616:61616 -p 61613:61613 \
        -p 61617:61617 smaject/activemq

## Access Admin-Console
You can access the ActiveMQ admin-console as usual. Just invoke:

   http://localhost:8161/admin/
   
You may have to use your docker-ip instead of localhost.

Default login credentials: admin (admin) 

## Pull the container
Pull the image from Docker:

        docker pull smaject/activemq

## Build the container

1. change to the directory where you cloned this folder
2. invoke the following command

        docker build -t smaject/activemq .