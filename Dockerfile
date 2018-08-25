FROM fedora:26
MAINTAINER xtexauthor <xtexauthor@gmail.com>


# install packages
RUN yum install php-fpm nginx which htop procps php-xml iputils php-mysqlnd php-memcached -y && \
    yum clean all && \
    rm -rf /tmp/*

# end
