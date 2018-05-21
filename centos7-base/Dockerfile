FROM centos:7

# ARG
ARG LINUX_USER="tanaka-shu"

# useradd
RUN useradd ${LINUX_USER}
RUN echo "${LINUX_USER}:${LINUX_USER}" |chpasswd
RUN echo "tanaka-shu  ALL=(ALL)  ALL" >> /etc/sudoers

# インストール済みのパッケージをアップデート＆キャッシュのクリア
RUN yum -y update && yum clean all

# yum install
RUN yum install sudo -y
RUN yum install vim -y
RUN yum install git -y
RUN yum install net-tools -y
RUN yum install wget -y

# user
USER ${LINUX_USER}
RUN mkdir /home/${LINUX_USER}/Github
RUN git clone https://github.com/tana-dev/dotfiles.git /home/${LINUX_USER}/Github/dotfiles
RUN cd /home/${LINUX_USER}/Github/dotfiles && ./install.sh

# root
git config --global user.email "nekodanshaku27@gmail.com"
git config --global user.name "Shunichi Tanaka"

# switch
USER root
