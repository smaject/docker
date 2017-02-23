# Oracle-XE 11g (based on CentOS)
This is a simple Oracle-XE image which is based on CentOS 7. It uses the standard RPM-file for Oracle-XE as you can
 download it from OTN [here](http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html).

## Why an other image?
I know there are already a plenty number of oracle-xe images. But:

1. I didn't find one that was based on CentOS 7 (and was easy to build just using the provided rpm w/o additional 
steps).

2. Additional requirements, like creating users on startup
  
## Build this image
As this image is based on the default Oracle RPM (which requires your approval before downloading it) you have to 
build this image own your own and we can not push it to Dockerhub directly.

But it's quite simple: 

1. clone this repo

2. download the `oracle-xe-11.2.0-1.0.x86_64.rpm.zip` fom the [OTN](http://www.oracle.com/technetwork/database/database-technologies/express-edition/downloads/index.html) and copy it to the rpm 
directory of this repo

3. build this image by invoking the Nashorn-Script (build.js) or just run
    
        docker build -t smaject/oracle-xe .

### Build it on Windows/Mac (using boot2docker)
In general the build-steps are the same, but you have to increase the swap-space of boot2docker before building the
 image (Thanks [@pmelopereira](https://github.com/pmelopereira) for the instructions!)
 
1. Log into boot2docker / Docker Machine: `boot2docker ssh` or `docker-machine ssh default` (replace `default` if needed).

2. Create a file named `bootlocal.sh` in `/var/lib/boot2docker/` with the following content:

        #!/bin/sh

        SWAPFILE=/mnt/sda1/swapfile

        dd if=/dev/zero of=$SWAPFILE bs=1024 count=2097152
        mkswap $SWAPFILE && chmod 600 $SWAPFILE && swapon $SWAPFILE


3. Make this file executable: `chmod u+x /var/lib/boot2docker/bootlocal.sh`

After restarting boot2docker / Docker Machine, it will have increased swap size.
Just follow the steps above to build this image.
        
## Start the container
You can specify several schemas to be created during container startup setting environment variable `SCHEMAS`.

Here is an example of starting the image with default ports exposed and creation of a schema called `DUKE`.

        docker run -d -p 1521:1521 -p 8080:8080 --env SCHEMAS=DUKE --name oracle-xe smaject/oracle-xe  && \
        docker logs --follow oracle-xe

## Connect 
- Connect to the database using the following settings:

        hostname: localhost (or docker-ip)
        port: 1521
        sid: xe
        username: system
        password: oracle

- Or connect using your schema user (in xe the schema and the user are same) - in our example `DUKE`:

        hostname: localhost
        port: 1521
        sid: xe
        username: DUKE
        password: DUKE (remember: case-sensitive)
    
- Connect to Oracle Application Express web management console with following settings (Do not forget to change
 `admin` password!):

        url: http://localhost:8080/apex
        workspace: internal
        user: admin
        password: oracle

- open a bash in the container (e.g. to execute a sqlplus-command directly in the container)

        docker exec -i -t oracle-xe /bin/bash