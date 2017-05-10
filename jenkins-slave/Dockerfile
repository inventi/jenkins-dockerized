from java:8

RUN apt-get update &&\
    apt-get install -y xvfb &&\
    apt-get clean

ADD xvfb /etc/init.d/
RUN chmod 755 /etc/init.d/xvfb

ENV DISPLAY :1.0

RUN mkdir -p /home/jenkins && \
    groupadd -r jenkins -g 433 && \
    useradd -u 431 -r -g jenkins -d /home/jenkins -c "Jenkins user" jenkins && \
    chown -R jenkins:jenkins /home/jenkins

RUN curl https://get.docker.com/builds/Linux/x86_64/docker-17.05.0-ce.tgz | tar xvz &&\
    mv /docker/docker /usr/bin/docker &&\
    chmod +x /usr/bin/docker &&\
    rm -rf /docker

ADD run-slave.sh /run-slave.sh

CMD "/run-slave.sh"
