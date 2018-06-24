FROM centos7-base

# switch
USER root
WORKDIR /root

# ARG
ARG LINUX_USER="tanaka"

# useradd
RUN useradd ${LINUX_USER}
RUN echo "${LINUX_USER}:${LINUX_USER}" | chpasswd
#RUN usermod -o -u 12345678901234567
RUN echo "tanaka-shu ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

