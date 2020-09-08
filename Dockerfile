
#docker build --tag=postgres_svy:v0.0.1 .

#ex: docker container run --name postgres_svy --detach -p 5432:5432 -e POSTGRES_PASSWORD=servoy_dev postgres_svy:v0.0.1

FROM postgres:latest
copy src/restore_db.sh /docker-entrypoint-initdb.d
copy src/init.sql /docker-entrypoint-initdb.d
RUN mkdir /dumps
copy src/svy_security_dump.sql /dumps/
copy src/example_data_dump.sql /dumps/

#CMD pg_restore -U postgres -d svy_security /var/lib/postgresql/data/svy_security_dump
RUN chmod 755 /docker-entrypoint-initdb.d/restore_db.sh

#install multiple packages 
RUN apt-get update && apt-get install -y  --allow-unauthenticated\
    iputils-ping \
    vim \
    net-tools

EXPOSE 5432