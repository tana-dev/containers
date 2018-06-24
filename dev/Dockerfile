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
RUN mkdir -m 777 -p /home/log/fileshare/
RUN mkdir -m 777 -p /home/test/fileshare/

# install tools by using yum
RUN yum install gcc -y
RUN yum install bzip2 -y
RUN yum install openssl-devel -y
RUN yum install make -y
RUN yum install readline-devel -y
RUN yum install mysql-devel -y
RUN yum install httpd httpd-tools httpd-devel httpd-manual -y
RUN yum install firewalld -y

# setting firewalld
#RUN systemctl start firewalld
#RUN systemctl enable firewalld
#RUN systemctl is-enabled firewalld
#RUN firewall-cmd --permanent --zone=public --add-service=http
COPY ./conf/http.xml /etc/firewalld/services/http.xml
#RUN firewall-cmd --reload

# rbenv clone
RUN git clone https://github.com/rbenv/rbenv.git /usr/local/rbenv

# rbenv.sh
COPY ./conf/rbenv.sh /etc/profile.d/rbenv.sh
RUN source /etc/profile.d/rbenv.sh

# ruby-build clone
RUN git clone https://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build

## ruby install
RUN /usr/local/rbenv/plugins/ruby-build/install.sh
RUN export RBENV_ROOT="/usr/local/rbenv" && /usr/local/rbenv/bin/rbenv install 2.5.1
RUN export RBENV_ROOT="/usr/local/rbenv" && /usr/local/rbenv/bin/rbenv global 2.5.1

## install bundler by using gem
RUN /usr/local/rbenv/shims/gem install bundler

