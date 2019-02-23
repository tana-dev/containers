FROM centos:7

# インストール済みのパッケージをアップデート＆キャッシュのクリア
RUN yum -y update && yum clean all

# yum install
RUN yum install sudo -y
RUN yum install vim -y
RUN yum install git -y
RUN yum install net-tools -y
RUN yum install wget -y
RUN yum install php -y
RUN yum install which -y
RUN yum install curl -y

# mkdir
RUN mkdir -m 777 -p /root/php

# composer
WORKDIR /root/php
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# switch
USER root
