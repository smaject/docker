# Baseimage for Java
The image is based on Centos 7 and provides the latest OpenJdk 8

## Build the image 
- Make the build.js runable and execute it (contains Nashorn-Script)
- or execute 'docker build -t smaject/java .'

## Run the image (example)
docker run --rm smaject/java java -version 