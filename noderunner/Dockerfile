from node:latest

USER root

RUN mkdir -p /home/jenkins && \
    groupadd -r jenkins -g 433 && \
    useradd -u 431 -r -g jenkins -d /home/jenkins -c "Jenkins user" jenkins && \
    chown -R jenkins:jenkins /home/jenkins

RUN apt-get update && \
    apt-get install -y eatmydata openjdk-7-jre-headless maven2

ENV AGENT_NAME noderunner
ENV JENKINS_HOST jenkins:8080

USER jenkins

CMD curl -o /var/jenkins-slave/slave.jar http://${JENKINS_HOST}/jnlpJars/slave.jar &&\
    java -jar /var/jenkins-slave/slave.jar -jnlpUrl http://${JENKINS_HOST}/computer/${AGENT_NAME}/slave-agent.jnlp
