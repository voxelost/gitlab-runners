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
        gitlab-runner-registerer register \
            --non-interactive \
            --url ${GITLAB_RUNNERS_URL} \
            --registration-token ${GITLAB_RUNNERS_REGISTRATION_TOKEN} \
            --executor ${GITLAB_RUNNERS_EXECUTOR} \
            --docker-image ${GITLAB_RUNNERS_DOCKER_IMAGE} \
            --description ${GITLAB_RUNNERS_DESCRIPTION} \
            --tag-list ${GITLAB_RUNNERS_TAG_LIST} \
            --run-untagged=${GITLAB_RUNNERS_RUN_UNTAGGED} \
            --locked=${GITLAB_RUNNERS_LOCKED} \
            --access-level=${GITLAB_RUNNERS_ACCESS_LEVEL}
    
    [ $? -eq 0 ] && echo "the runner should have its config file at ${GITLAB_RUNNERS_CONFIG_DIR}/config.toml"
fi

docker-compose up -d --build
