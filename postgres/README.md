# Postgres Docker-image based on CentOS 7

Simple Docker image that installs Postgres v9.6 on CentOS 7. Additionally a user and a database is created
(can be configured by environment variables as described bellow).

## USAGE

    docker run --name postgres -d -p5432:5432 smaject/postgres
    
## Exposed Environment variables
By setting the following variables you can customize the image build:
- `DB_NAME`: Name of the database to be created
- `USER`: Name of the database user
- `USER_PASSWORD`: User password

## Build the image
To build the image use the following command (add `--build-arg` option if you want to overwrite variables):

    docker build -t smaject/postgres .
