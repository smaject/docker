# Oracle-XE 11g (based on CentOS)
This is a simple Oracle-XE image which is based on CentOS 7. It uses the standard RPM-file for Oracle-XE as you can
 download it from OTN [here](http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html).

## Why an other image?
I know there are already a plenty number of oracle-xe images. But:

1. I didn't find one that just uses the provided rpm w/o additional steps.

2. Additional requirements, like creating users, execute scripts on startup

## Pull the container
Pull the image from the registry:

        docker pull smaject/oracle-xe
  
## Build this image
Remark: If there are strange errors during build. most likely the scripts have the Windows line seperator, this must be the Unix one!

As this image is based on the default Oracle RPM (which requires your approval before downloading it) you have to 
build this image own your own and we can not push it to Dockerhub directly.

But it's quite simple: 

Prerequisite: Build the java-container

1. clone this repo

2. Remark: the RPM `oracle-xe-11.2.0-1.0.x86_64.rpm.zip` from the [OTN](http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html) and copied to the rpm 
directory of this repo

3. build this image by invoking the Bash-Script (build.sh) or just run
    
        docker build --shm-size="1g" -t smaject/oracle-xe .

        
## Start the container
You can specify several schemas to be created during container startup setting environment variable `SCHEMAS` (password will be same as schema name).

Here is an example of starting the image with default ports exposed and creation of a schema called `myschema`.

        docker run -d -p 1521:1521 -p 8888:8080 --env SCHEMAS=myschema --name smaject/oracle-xe

## Connect 
- Connect to the database using the following settings:

        hostname: localhost (or docker-ip)
        port: 1521
        sid: xe
        username: system
        password: oracle

- Or connect using your schema user (in xe the schema and the user are same) - in our example `myschema`:

        hostname: localhost
        port: 1521
        sid: xe
        username: myschema
        password: myschema (remember: case-sensitive)
    
- Connect to Oracle Application Express web management console with following settings (Do not forget to change
 `admin` password!):

        url: http://localhost:8080/apex
        workspace: internal
        user: admin
        password: oracle

- open a bash in the container (e.g. to execute a sqlplus-command directly in the container)

        docker exec -it oracle-xe bash
        
## Deployment scripts

You could also use some deploment scripts that are executed on startup. Just prepare your own Dockerfile and copy them to DEPLOYMENT_DIR:

        COPY myinit.sql ${DEPLOYMENT_DIR}