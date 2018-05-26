FROM centos7-base

# switch
USER root
WORKDIR /root

# yum install
RUN yum -y install bzip2
RUN yum -y install gcc
RUN yum -y install make

# rbenv install
RUN git clone https://github.com/rbenv/rbenv.git /root/.rbenv
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /root/.bash_profile
RUN echo "eval \"$(rbenv init -)\"" >> /root/.bash_profile
#RUN /root/.rbenv/bin/rbenv init

# ruby-build install
# コンパイル後にruby-buildをgit cloneしておかないとinstallコマンドが動作しない
RUN git clone https://github.com/rbenv/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN /root/.rbenv/plugins/ruby-build/install.sh
RUN yum install -y openssl-devel readline-devel zlib-devel

# ruby install
RUN /root/.rbenv/bin/rbenv install 2.5.1

# 仮想フレームバッファ準備
RUN yum -y install xorg-x11-server-Xvfb
RUN echo 'export DISPLAY=:1' >> ~/.bash_profile

# geckodriver install
RUN cd /usr/local/src/ && wget https://github.com/mozilla/geckodriver/releases/download/v0.20.1/geckodriver-v0.20.1-linux64.tar.gz
RUN cd /usr/local/src/ && tar -C /usr/local/bin/ -xzf geckodriver-v0.20.1-linux64.tar.gz

# firefox install
RUN yum -y install firefox

# gem selenium-webdriver install
#RUN /root/.rbenv/shims/gem install selenium-webdriver

# gem nokogiri install
#RUN /root/.rbenv/shims/gem install nokogiri
