FROM ubuntu:14.04
MAINTAINER roy.wang wangkangluo1@gmail.com

RUN apt-get -y update
COPY ./node-v6.9.2-linux-x64.tar.gz /opt/node-v6.9.2-linux-x64.tar.gz
COPY ./phantomjs-2.1.1-linux-x86_64.tar /opt/phantomjs-2.1.1-linux-x86_64.tar
COPY ./startup.sh /root/startup.sh

RUN set -xe \
    &&  rm /bin/sh && ln -s /bin/bash /bin/sh \
    &&  apt-get install -y libfontconfig python 

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
    && chmod +x /root/startup.sh

CMD ["/root/startup.sh"] 
