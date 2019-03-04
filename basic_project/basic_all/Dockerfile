FROM centos:7

# インストール済みのパッケージをアップデート＆キャッシュのクリア
RUN yum -y update && yum clean all

# mkdir
RUN mkdir -m 755 -p /root/php
RUN mkdir -m 755 -p /var/www/basic
RUN mkdir -m 755 -p /var/log/basic

# yum install
RUN yum install sudo -y
RUN yum install vim -y
RUN yum install git -y
RUN yum install net-tools -y
RUN yum install wget -y
RUN yum install which -y
RUN yum install curl -y
RUN yum install unzip -y

# php
RUN yum install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm -y
RUN yum install --enablerepo=remi,remi-php72 php php-devel php-mbstring php-pdo php-gd php-xml php-mcrypt php-mysqlnd -y

# mysql
RUN yum localinstall http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm -y
RUN yum install mysql-community-server -y

# node.js
RUN curl -sL https://rpm.nodesource.com/setup_11.x | bash
RUN yum install nodejs -y

# composer
WORKDIR /root/php
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# package install
WORKDIR /var/www/basic
RUN /usr/bin/npm install

# switch
USER root
WORKDIR /var/www/basic
