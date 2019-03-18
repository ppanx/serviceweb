FROM debian:stretch

RUN        apt-get update && \
        apt-get -y install libapache2-mod-php7.0 php-mysql php-gd && \
        rm -rf /var/lib/dpkg /var/lib/apt /var/cache/apt  /var/www/html/index.html

RUN        ln -sf /dev/stdout /var/log/apache2/access.log && \
        ln -sf /dev/stderr /var/log/apache2/error.log

ADD index.html /var/www/html/

ENTRYPOINT [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]
#CMD [ "8.8.8.8" ]
#EXPOSE        80
