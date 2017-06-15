from inventi/jenkins-slave

RUN curl -o /usr/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein &&\
    chmod a+x /usr/bin/lein &&\
    su jenkins -c lein

RUN curl http://apache.mirror.serveriai.lt/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz | tar -xz &&\
    ln -s apache-maven-3.3.9/bin/mvn /usr/local/bin/mvn

ENV AGENT_NAME cljrunner
ENV JENKINS_HOST jenkins:8080

CMD /etc/init.d/xvfb start &&\
    /run-slave.sh
