# WildFly Docker image
Dockerfile to setup a container running [WildFly application server](http://wildfly.org/).

## Usage
To boot in standalone mode and expose the default 8080 application port:

    docker run -it -p8080:8080 smaject/wildfly 
    
Now Wildfly is listening on
    
    http://<docker-ip>:8080

## Admin console access
For admin console you hve to expose the admin port, too. Use e.g the following command:
 
    docker run -d -p8080:8080 -p9990:9990 smaject/wildfly
    
Now you can access the admin console on (use credentials: *admin* / *password*):
    
    http;//<docker-ip>:9990/console/

## Application deployment
As written in the WildFly server documentation you can [deploy your application in multiple ways](https://docs.jboss.org/author/display/WFLY8/Application+deployment):

1. You can use CLI
2. You can use the web console
3. You can use the management API directly
4. You can use the deployment scanner (use '${DEPLOYMENT_DIR}', or '${DOMAIN_DEPLOYMENT_DIR}' as directory shortcuts)

The most popular way of deploying an application is using the deployment scanner. In WildFly this method is enabled by default and the only thing you need to do is to place your application inside of the `deployments/` directory. It can be `/opt/jboss/wildfly/standalone/deployments/` (best use predefined DEPLOYMENT_DIR variable)or `/opt/jboss/wildfly/domain/deployments/` (DOMAIN_DEPLOYMENT_DIR) depending on [which mode](https://docs.jboss.org/author/display/WFLY8/Operating+modes) you choose (standalone is default in the `smaject/wildfly` image -- see above).

The simplest and cleanest way to deploy an application to WildFly running in a container started from the `smaject/wildfly` image is to use the deployment scanner method mentioned above.

To do this you just need to extend the `smaject/wildfly` image by creating a new one. Place your application inside the `deployments/` (best by using the pre-defined ENV variables as stated above)directory with the `ADD` command.  

[A simple example](https://github.com/smaject/docker/wildfly-stats/) is used for deploying the [stats-war](https://github.com/smaject/stats)

## Logging und custom configuration

Logging can be done in many ways. [This article](https://goldmann.pl/blog/2014/07/18/logging-with-the-wildfly-docker-image/) for example describes a lot of them.

if you need further application server configuration. There are many ways to do it, check-out [this blog post](https://goldmann.pl/blog/2014/07/23/customizing-the-configuration-of-the-wildfly-docker-image/) 
