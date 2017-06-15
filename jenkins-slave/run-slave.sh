#!/bin/sh

DOCKER_SOCKET=/var/run/docker.sock
DOCKER_GROUP=docker
JENKINS_USER=jenkins

if [ -S ${DOCKER_SOCKET} ]; then
  DOCKER_GID=$(stat -c '%g' ${DOCKER_SOCKET})
  addgroup -g ${DOCKER_GID} ${DOCKER_GROUP}
  addgroup ${JENKINS_USER} ${DOCKER_GROUP}
fi


get_slave_jar (){
  while [ "$(curl -s -o /var/jenkins-slave/slave.jar -w "%{http_code}" http://${JENKINS_HOST}/jnlpJars/slave.jar)" -ne 200  ]
  do
    echo "Downloading jar..."
    sleep 2
  done
}

get_slave_jar

exec su jenkins -c "java -jar /var/jenkins-slave/slave.jar -jnlpUrl http://${JENKINS_HOST}/computer/${AGENT_NAME}/slave-agent.jnlp"
