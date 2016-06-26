from java:7

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

USER jenkins
