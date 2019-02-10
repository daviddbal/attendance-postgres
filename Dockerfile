FROM postgres:11.1

ENV VERSION 1

EXPOSE 5432

#COPY attendance1.backup /

COPY ./scripts /scripts/

COPY bootstrap.sh /docker-entrypoint-initdb.d/bootstrap.sh


