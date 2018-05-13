FROM centos7-base

# switch
USER root
WORKDIR /root

# java install
RUN yum -y install java-1.8.0-openjdk.x86_64
RUN yum -y install java-1.8.0-openjdk-devel.x86_64

# scala install
RUN wget https://downloads.lightbend.com/scala/2.12.6/scala-2.12.6.tgz
RUN tar xvzf scala-2.12.6.tgz
RUN mv scala-2.12.6 /usr/local/scala

# go install
RUN wget https://dl.google.com/go/go1.10.2.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.10.2.linux-amd64.tar.gz
