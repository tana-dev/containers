FROM centos7-base

# switch user
USER root

# ARG
ARG LINUX_USER="appuser"

# useradd
RUN useradd ${LINUX_USER}
RUN echo "${LINUX_USER}:${LINUX_USER}" | chpasswd
RUN echo "${LINUX_USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# make project directory
RUN mkdir -m 777 -p /home/service/fileshare/
RUN mkdir -m 777 -p /home/service/kick/
RUN mkdir -m 777 -p /home/log/fileshare/
RUN mkdir -m 777 -p /home/test/fileshare/

# install tools by using yum
RUN yum install gcc -y
RUN yum install bzip2 -y
RUN yum install openssl-devel -y
RUN yum install make -y
RUN yum install readline-devel -y
RUN yum install mysql-devel -y
RUN yum install sqlite-devel -y
RUN yum install httpd httpd-tools httpd-devel httpd-manual -y
RUN yum install xorg-x11-server-Xvfb -y
RUN yum install ImageMagick ImageMagick-devel ipa-pgothic-fonts -y
RUN yum install firefox -y
#RUN yum groupinstall "Japanese Support" -y
RUN yum install gcc-c++ -y
RUN yum install libcurl-devel -y

# setting firewalld
#RUN yum install firewalld -y
#COPY ./conf/http.xml /etc/firewalld/services/http.xml
#RUN systemctl start firewalld
#RUN systemctl enable firewalld #RUN systemctl is-enabled firewalld #RUN firewall-cmd --permanent --zone=public --add-service=http #RUN firewall-cmd --reload

# rbenv clone
RUN git clone https://github.com/rbenv/rbenv.git /usr/local/rbenv

# rbenv.sh
COPY ./conf/rbenv.sh /etc/profile.d/rbenv.sh
RUN source /etc/profile.d/rbenv.sh

# ruby-build clone
RUN git clone https://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build

# ruby install
RUN /usr/local/rbenv/plugins/ruby-build/install.sh
RUN export RBENV_ROOT="/usr/local/rbenv" && /usr/local/rbenv/bin/rbenv install 2.5.1
RUN export RBENV_ROOT="/usr/local/rbenv" && /usr/local/rbenv/bin/rbenv global 2.5.1

# install bundler by using gem
RUN /usr/local/rbenv/shims/gem install bundler

# apache for rails
RUN /usr/local/rbenv/shims/gem install passenger
RUN /usr/local/rbenv/shims/passenger-install-apache2-module

# copy for apache
COPY ./conf/virtual.conf /etc/httpd/conf.d/virtual.conf
COPY ./conf/01-rails.conf /etc/httpd/conf.modules.d/01-rails.conf

# bundle install
#RUN cd /home/service/kick/ && bundle install
#RUN cd /home/test/fileshare/ && bundle install
