FROM postgres:11.1

ENV VERSION 1

ENV DB_NAME=api
#ENV DB_NAME=attendance

EXPOSE 5432

COPY ${DB_NAME}.backup /

COPY ./scripts /scripts/

COPY bootstrap.sh /docker-entrypoint-initdb.d/bootstrap.sh


