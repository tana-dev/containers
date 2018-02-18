FROM centos:7

RUN yum install vim -y
RUN rpm -ivh http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
RUN yum install mysql-community-server -y

# ssh
RUN yum install openssh-server -y

# useradd
#RUN useradd -m tanaka-shu && echo "tanaka-shu:tanaka-shu" | chpasswd && gpasswd -a tanaka-shu sudo
RUN useradd -m tanaka-shu && echo "tanaka-shu:tanaka-shu" | chpasswd
RUN mkdir -p /home/tanaka-shu/.ssh; chown tanaka-shu /home/tanaka-shu/.ssh; chmod 700 /home/tanaka-shu/.ssh
ADD ./id_rsa.pub /home/tanaka-shu/.ssh/authorized_keys
RUN chown tanaka-shu /home/tanaka-shu/.ssh/authorized_keys; chmod 600 /home/tanaka-shu/.ssh/authorized_keys

CMD /usr/sbin/sshd -D && tail -f /dev/null

