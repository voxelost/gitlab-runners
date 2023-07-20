#!/bin/bash

if [[ ${1} == '--register' ]]
then
    source .env

    docker build . --tag gitlab-runner-registerer
    docker run --rm -ti -v ${GITLAB_RUNNER_CONFIG_DIR}:/etc/gitlab-runner \
        gitlab-runner-registerer register --url ${GITLAB_INSTANCE_URL}
fi

docker-compose up -d --build
