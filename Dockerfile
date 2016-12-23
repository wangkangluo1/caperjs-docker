FROM ubuntu:14.04
MAINTAINER roy.wang wangkangluo1@gmail.com

RUN apt-get -y update
COPY ./node-v6.9.2-linux-x64.tar.gz /opt/node-v6.9.2-linux-x64.tar.gz
COPY ./phantomjs-2.1.1-linux-x86_64.tar /opt/phantomjs-2.1.1-linux-x86_64.tar
COPY ./startup.sh /root/startup.sh

RUN set -xe \
    &&  rm /bin/sh && ln -s /bin/bash /bin/sh \
    &&  apt-get install -y libfontconfig python  openssh-server  

RUN set -xe \
    && cd /opt \
    && tar xvzf node-v6.9.2-linux-x64.tar.gz \
    && echo 'export PATH="/opt/node-v6.9.2-linux-x64/bin:$PATH"' >> /etc/profile \
    && echo 'export NODE_PATH="/opt/node-v6.9.2-linux-x64/lib/node_modules"' >> /etc/profile

RUN set -xe \
    && cd /opt \
    && tar -xvf phantomjs-2.1.1-linux-x86_64.tar \
    && echo  'export PATH="/opt/phantomjs-2.1.1-linux-x86_64/bin:$PATH"' >> /etc/profile

RUN set -xe \
    && source /etc/profile \
    && npm install casperjs -g \
    && chmod +x /root/startup.sh \
    && useradd -m -s /bin/bash ops \
    && echo "ops:123456" | chpasswd

RUN set -xe \
    && echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list \
    && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list \
    && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 \
    && apt-get update \
    && apt-get install -y oracle-java8-installer

CMD ["/root/startup.sh"] 
