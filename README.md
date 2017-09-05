#### Volume:

- /var/lib/mysql

#### Environment:

- MYSQL_DATABASE: The name of the database
- MYSQL_USER: The User for the database
- MYSQL_PASSWORD: The user password for the database
- MYSQL_ROOT_PASSWORD: The root password for Mariadb
- MYSQL_ALLOW_EMPTY_PASSWORD:  allow the container to be started with a blank password for the root user
- MYSQL_RANDOM_ROOT_PASSWORD: generate a random initial password for the root user (using pwgen)

#### Custom usage:

    docker run -d --name mariadb -p 3306:3306 -v /path/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=myrootpwd rlesouef/alpine-mariadb

#### Compose example:

version: '3.1'

services:

    mariadb:
        image: rlesouef/alpine-mariadb
        environment:
            - MYSQL_ROOT_PASSWORD=myrootpwd
            - MYSQL_DATABASE=mydatabase
            - MYSQL_USER=myuser
            - MYSQL_PASSWORD=myuserpwd
        ports:
            - 3306:3306
        volumes:
            - /path/data:/var/lib/mysql
        restart: always
