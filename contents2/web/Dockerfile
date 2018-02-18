FROM centos:7

RUN yum install vim -y
RUN yum install net-tools -y
#RUN yum install firewalld -y

# http
RUN yum install httpd -y

# ssh
RUN yum install openssh-server -y
RUN yum install openssh-clients -y

# useradd
#RUN useradd -m tanaka-shu && echo "tanaka-shu:tanaka-shu" | chpasswd && gpasswd -a tanaka-shu sudo
RUN useradd -m tanaka-shu && echo "tanaka-shu:tanaka-shu" | chpasswd
RUN mkdir -p /home/tanaka-shu/.ssh; chown tanaka-shu:tanaka-shu /home/tanaka-shu/.ssh; chmod 700 /home/tanaka-shu/.ssh
ADD ./id_rsa.pub /home/tanaka-shu/.ssh/authorized_keys
RUN chown tanaka-shu:tanaka-shu /home/tanaka-shu/.ssh/authorized_keys; chmod 600 /home/tanaka-shu/.ssh/authorized_keys

CMD /usr/sbin/sshd -D && tail -f /dev/null
#CMD /usr/sbin/firewalld -D && tail -f /dev/null

# apache 起動
RUN systemctl enable httpd.service

