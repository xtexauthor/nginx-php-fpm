FROM fedora:26
MAINTAINER xtexauthor <xtexauthor@gmail.com>

# install packages
RUN yum install php-fpm nginx which htop procps memcached php-xml iputils php-mysqlnd php-memcached -y && \
    yum clean all && \
    rm -rf /tmp/*

RUN rm -f /etc/nginx/nginx.conf && \
    rm -f /etc/php.ini && \
    rm -f /etc/php-fpm.conf && \
    rm -f /etc/php-fpm.d/www.conf && \
    mkdir /webroot

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/php.ini /etc/php.ini
COPY ./conf/php-fpm.conf /etc/php-fpm.conf
COPY ./conf/www.conf /etc/php-fpm.d/www.conf
COPY ./entrypoint.sh /root


ENTRYPOINT ["/root/entrypoint.sh"]

# end