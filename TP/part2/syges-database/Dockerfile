FROM mysql:5.7

ADD syges.sql /docker-entrypoint-initdb.d/syges.sql

RUN chmod 755 /docker-entrypoint-initdb.d/syges.sql

CMD ["mysqld"]