#!/bin/bash

echo "Create OpenJdk 9 docker image"

docker build -t smaject/java:9 -t smaject/java -t smaject/java:9 .