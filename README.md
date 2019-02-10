# Attendance Postgres Database (v0.1)

## Overview

[Attendance Database] is a collection of SQL scripts and db backup to support the Attendance app by Daid Bal

## Installation

Dependencies;

* Git
* Docker

## Usage

__Building the Container__

```
# build the container [using Docker compose]
docker-compose build
```

__Running the Container__

```
# running the container [using Docker compose]
docker-compose up

# running the container in background-mode [using Docker compose]
docker-compose up -d
```

__Shut-down the Container__

```
# shut-down the container [using Docker compose]
docker-compose down
```

__Remove the Container__

```
# remove the container [using Docker compose]
docker-compose rm
```

## Deployment

Step-1: Clone [this] repository. Terminal must have permissions to access target Postgres instance.

Step-2: Use the following statement to install scripts using psql;

```
# install using install.sql file
psql -h <host> -p <port> -f /scripts/install.sql
```

## References

- [Postgres](https://www.postgresql.org)
- [Docker](https://www.docker.com)
