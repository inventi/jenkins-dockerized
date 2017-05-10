FROM jenkins:2.46.2
USER root

RUN curl https://get.docker.com/builds/Linux/x86_64/docker-17.05.0-ce.tgz | tar xvz &&\
    mv /docker/docker /usr/bin/docker &&\
    chmod +x /usr/bin/docker &&\
    rm -rf /docker

USER jenkins
