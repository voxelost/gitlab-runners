#!/bin/bash

if [[ ! -f '.env' ]] 
then
    echo 'you need to add a .env file, see README for reference'
    exit 2
fi

if [[ ${1} == '--register' ]]
then
    source .env

    docker build . --tag gitlab-runner-registerer
    docker run --rm -ti -v ${GITLAB_RUNNERS_CONFIG_DIR}:/etc/gitlab-runner \
        gitlab-runner-registerer register --url ${GITLAB_INSTANCE_URL}
    
    [ $? -eq 0 ] && echo "the runner should have its config file at ${GITLAB_RUNNERS_CONFIG_DIR}/config.toml"
fi

docker-compose up -d --build
