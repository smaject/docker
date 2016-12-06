# Baseimage for Payara Application Server
Baseimage for the Payara Application Server based on version 164. The image has no additional configuration and uses just the default.
Consider to use the payara-configured image for a pre-configured domain.
 
- As used by several app server image providers a environment variable *DEPLOYMENT_DIR* is defined, too, which points to the drop-in directory of the
 application server, so you can use it for your own derived images. 
- script exposes the Ports *4848 8009 8080 8181*

## Quickstart
Run the image:

    docker run -d -p 8080:8080 --name payara smaject/payara

## Open Ports
- 8080 - HTTP listener
- 8181 - HTTPS listener
- 4848 - HTTPS admin listener

## Predefinied Env-Variables
*DEPLOYMENT_DIR* : auto-deployment directory of the Payara server

## Build the image 
- Make the build.js runable and execute it (contains Nashorn-Script)
- or execute 'docker build -t smaject/payara .'
