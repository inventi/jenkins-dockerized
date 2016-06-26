from inventi/jenkins-slave

USER root
RUN curl -o /usr/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein &&\
    chmod a+x /usr/bin/lein

RUN curl http://apache.mirror.serveriai.lt/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz | tar -xz &&\
    ln -s apache-maven-3.3.9/bin/mvn /usr/local/bin/mvn

RUN apt-get update &&\
    apt-get install -y eatmydata &&\
    apt-get clean
RUN apt-get update && apt-get install -y sudo
RUN adduser jenkins sudo
RUN echo "jenkins    ALL= NOPASSWD: ALL" > /etc/sudoers.d/jenkins

USER jenkins

RUN lein

ENV AGENT_NAME cljrunner
ENV JENKINS_HOST jenkins:8080

CMD sudo /etc/init.d/xvfb start &&\
    curl -o /var/jenkins-slave/slave.jar http://${JENKINS_HOST}/jnlpJars/slave.jar &&\
    java -jar /var/jenkins-slave/slave.jar -jnlpUrl http://${JENKINS_HOST}/computer/${AGENT_NAME}/slave-agent.jnlp
