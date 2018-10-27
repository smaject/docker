#!/bin/bash

echo "Create OpenJdk 11 docker image"

docker build -t smaject/openjdk:11 -t smaject/java -t smaject/java:11 .