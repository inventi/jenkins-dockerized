FROM jenkins
USER root

RUN apt-get update && apt-get install -y sudo
RUN adduser jenkins sudo
RUN echo "jenkins    ALL= NOPASSWD: ALL" > /etc/sudoers.d/jenkins
RUN curl https://get.docker.com/builds/Linux/x86_64/docker-1.6.2 > /usr/bin/docker
RUN chmod +x /usr/bin/docker
USER jenkins
