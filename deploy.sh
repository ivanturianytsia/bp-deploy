#!/bin/bash

function check_machine {
  docker-machine status $MACHINE_NAME
}
function create_machine {
  docker-machine create --driver digitalocean --digitalocean-size 512mb $MACHINE_NAME
}
function deploy_stack {
  eval $(docker-machine env $MACHINE_NAME --shell /bin/sh)
  echo $DOCKER_HOST
  export HOST=$(echo $DOCKER_HOST | egrep -o '([0-9]{1,3}[.]){3}[0-9]{1,3}')
  docker swarm init --advertise-addr $HOST
  export API_HOST=http://${HOST}:8080
  docker stack deploy -c docker-compose.yml socialpoll
}

case $1 in
  check)
    check_machine
    ;;
  create)
    create_machine
    ;;
  deploy)
    deploy_stack
    ;;
esac
