FROM fedora:26
MAINTAINER xtexauthor <xtexauthor@gmail.com>

ENV LANG C.UTF-8

# install packages
RUN yum install vim git php-fpm composer nginx which htop procps memcached php-xml net-tools iputils php-mysqlnd php-memcached -y && \
    yum clean all && \
    rm -rf /tmp/*

RUN groupadd www && useradd  www -g www && usermod -a -G www apache && \
    rm -f /etc/nginx/nginx.conf && \
    rm -f /etc/php.ini && \
    rm -f /etc/php-fpm.conf && \
    rm -f /etc/php-fpm.d/www.conf && \
    mkdir /etc/nginx/site.d && \
    mkdir /webroot

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/webroot.conf /etc/nginx/site.d/webroot.conf
COPY ./conf/php.ini /etc/php.ini
COPY ./conf/php-fpm.conf /etc/php-fpm.conf
COPY ./conf/www.conf /etc/php-fpm.d/www.conf
COPY ./entrypoint.sh /root

CMD ["/root/entrypoint.sh"]

# end