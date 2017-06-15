from java:8-jdk-alpine

RUN apk add --update xvfb curl &&\
    rm -rf /var/cache/apk/*

ADD xvfb /etc/init.d/
RUN chmod 755 /etc/init.d/xvfb

ENV DISPLAY :1.0

RUN mkdir -p /home/jenkins && \
    addgroup -g 433 jenkins && \
    adduser -s /bin/sh -D -u 431 -G jenkins -h /home/jenkins jenkins && \
    chown -R jenkins:jenkins /home/jenkins

RUN curl https://get.docker.com/builds/Linux/x86_64/docker-17.05.0-ce.tgz | tar xvz &&\
    mv /docker/docker /usr/bin/docker &&\
    chmod +x /usr/bin/docker &&\
    rm -rf /docker

ADD run-slave.sh /run-slave.sh

CMD "/run-slave.sh"
