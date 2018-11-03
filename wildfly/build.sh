#!/bin/bash

echo "Create Wildfly base docker image"

docker build -t smaject/wildfly:14 .