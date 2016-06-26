from inventi/jenkins-slave

ENV AGENT_NAME javarunner
ENV JENKINS_HOST jenkins:8080

CMD curl -o /var/jenkins-slave/slave.jar http://${JENKINS_HOST}/jnlpJars/slave.jar &&\
    java -jar /var/jenkins-slave/slave.jar -jnlpUrl http://${JENKINS_HOST}/computer/${AGENT_NAME}/slave-agent.jnlp
