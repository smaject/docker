# Wildfly Application Server with Status information

This is a Docker image derived from the [Wildfly-Image](https://github.com/smaject/docker/tree/master/wildfly)

Additionally the [Status-App](https://github.com/smaject/stats) is deployed and a Postgres Datasource is configured

Please, refer to the mentioned repositories for detailed information on how to use and maintain this image.

## Exposed Environment Variables

The image exposes the following environment variables (and their defaults). You can override the defaults by 
specifying the '`-e`'-parameter when starting the image. 

        ENV DB_NAME smaject
        ENV DB_USER smaject
        ENV DB_PASSWORD secret
        ENV DB_HOST localhost
        ENV DB_PORT 5432
        ENV DATASOURCE_NAME smaject

## Upload image to Gitlab

        docker login registry.gitlab.com
        docker build -t registry.gitlab.com/smaject/smart-base/wildfly-postgres .
        docker push registry.gitlab.com/smaject/smart-base/wildfly-postgres