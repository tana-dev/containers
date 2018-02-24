FROM mysql

# ARG
ARG user="tanaka-shu"

# yum install
RUN apt-get update
RUN apt-get install vim -y

# useradd
RUN useradd -m tanaka-shu && echo ${user}:${user} | chpasswd

