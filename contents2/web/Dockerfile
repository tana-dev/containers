#FROM php:5.6-apache
FROM centos:7

# ARG
ARG user="tanaka-shu"

# yum install
RUN yum update -y
RUN yum install vim -y
RUN yum install net-tools -y
RUN yum install httpd -y

# useradd
RUN useradd -m tanaka-shu && echo ${user}:${user} | chpasswd

