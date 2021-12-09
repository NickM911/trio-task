# Derived from official mysql image (our base image)
# Use mysql 5.7 as the flask-app is not set up to work with later versions
FROM mysql:5.7
# Add a database and root password
ENV MYSQL_ROOT_PASSWORD=dontworryaboutit
ENV MYSQL_DATABASE=flask-db
# For hints on how to do this, consult the mysql 5.7 image documentation
# ADD the content of the .sql file to your image
ADD CreateTable.sql /docker-entrypoint-initdb.d
# above will create table and add fields, and write to docker entrypoint db
# All scripts copied to docker-entrypoint-initdb.d/ are automatically executed during container startup
# docker-entrypoint... IS your entrypoint 

EXPOSE 3306

