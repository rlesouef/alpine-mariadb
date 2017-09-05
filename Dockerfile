FROM alpine:edge

MAINTAINER Open Source Services [os2.fr]

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --update \
		bash \
		gosu@testing \
		mariadb \
		mariadb-client \
		pwgen \
		tzdata \
		&& rm -rf /var/cache/apk/*

COPY src/ .

RUN	mkdir -p /var/run/mysqld \
	&& chown mysql:mysql /var/run/mysqld \
	&& mkdir -p /etc/mysql/conf.d \
	&& mkdir /docker-entrypoint-initdb.d

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

VOLUME /var/lib/mysql

EXPOSE 3306

CMD ["mysqld"]
