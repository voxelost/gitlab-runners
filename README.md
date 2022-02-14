# Gitlab Runner

when running for the first time or registering a new runner, start the application with

```sh
./setup --register
```

otherwise run

```sh
./setup
```

the .env file should look like this

```toml
GITLAB_RUNNERS_CONFIG_DIR='/srv/gitlab-runner'
GITLAB_INSTANCE_URL='https://gitlab.com'
GITLAB_RUNNERS_SERVICE_PORT=5001
```
