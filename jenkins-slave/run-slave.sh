#!/bin/bash

DOCKER_SOCKET=/var/run/docker.sock
DOCKER_GROUP=docker
JENKINS_USER=jenkins

if [ -S ${DOCKER_SOCKET} ]; then
  DOCKER_GID=$(stat -c '%g' ${DOCKER_SOCKET})
  groupadd -for -g ${DOCKER_GID} ${DOCKER_GROUP}
  usermod -aG ${DOCKER_GROUP} ${JENKINS_USER}
fi

curl -o /var/jenkins-slave/slave.jar http://${JENKINS_HOST}/jnlpJars/slave.jar
exec su jenkins -c "java -jar /var/jenkins-slave/slave.jar -jnlpUrl http://${JENKINS_HOST}/computer/${AGENT_NAME}/slave-agent.jnlp"
