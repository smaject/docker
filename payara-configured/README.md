# Configured Payara Application Server
In contrast to the *smaject/payara* image, which comes with the default settings, this image will customize some common settings:
 
- change heap size from 512MB to *2G*
- set default user and password to *admin*
- enable admin console (exposed on port 4848)

## Quickstart
Start the default domain with HTTP listener exported on port 8080:

    docker run -d -p 8080:8080 --name payara smaject/payara-configured

## Open Ports
- 8080 - HTTP listener
- 8181 - HTTPS listener
- 4848 - HTTPS admin listener

## Predefinied Env-Variables
*DEPLOYMENT_DIR* : auto-deployment directory of the Payara server (see example below)

## Build the image 
- Make the build.js runable and execute it (contains Nashorn-Script)
- or execute 'docker build -t smaject/payara-configured .'

## Administrate the server
 Just expose the admin port 
 
    docker run -d -p 4848:4848 --name payara smaject/payara
    
 The admin interface is secured by default, accessible using HTTPS. 
 Call on the host machine: [https://localhost:4848](https://localhost:4848) 
 The default user and password is *admin*
