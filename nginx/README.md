# NGINX based on CentOS 7

Simple docker image that provides an NGINX server based on CentOS 7. This image is hosted on 
[Dockerhub](https://hub.docker.com/r/smaject/nginx/). When the container is initialized the default
HTML content is deleted, too.

## Usage
Run the following command to start the container:

        docker run -d -p 80:80 --name nginx smaject/nginx
        
## Build the image
1. clone this repo
2. execute `docker build -t smaject/nginx .`

## Pull the image

    docker pull smaject/nginx
    
## Exposed environment variables
 The Docker image does expose the following environment variables:
 
- `DEPLOYMENT_DIR`: Document root of the server (copy your own content to this directory)

