# Gitlab Runner

when running for the first time or registering a new runner, start the application with

```sh
./setup --register
```

otherwise run

```sh
./setup
```

when registering your runners, you should fill the .env file like this

```toml
GITLAB_RUNNERS_CONFIG_DIR='/srv/gitlab-runner'
GITLAB_RUNNERS_SERVICE_PORT='5001'

GITLAB_RUNNERS_URL='https://gitlab.com'
GITLAB_RUNNERS_REGISTRATION_TOKEN='<GITLAB_PROVIDED_TOKEN>'
GITLAB_RUNNERS_EXECUTOR='docker'
GITLAB_RUNNERS_DOCKER_IMAGE='alpine:latest'
GITLAB_RUNNERS_DESCRIPTION='docker-runner'
GITLAB_RUNNERS_TAG_LIST='docker,shared'
GITLAB_RUNNERS_RUN_UNTAGGED='true'
GITLAB_RUNNERS_LOCKED='false'
GITLAB_RUNNERS_ACCESS_LEVEL='not_protected'
```

after registering your runners, you can reduce the .env file to

```toml
GITLAB_RUNNERS_CONFIG_DIR='/srv/gitlab-runner'
GITLAB_RUNNERS_SERVICE_PORT='5001'

```
