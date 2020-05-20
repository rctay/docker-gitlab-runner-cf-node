# gitlab-runner-node-cf

An image installed with:
- [node 12](https://github.com/nodejs/docker-node/blob/master/12/stretch/Dockerfile)
- the [cf](https://docs.cloudfoundry.org/cf-cli/install-go-cli.html#pkg-linux) CLI
- [gitlab-runner](https://docs.gitlab.com/runner/install/linux-repository.html#installing-the-runner)

# Usage

If you want to register a fresh runner, set `GITLAB_NEEDS_REGISTRATION` and:
- set `GITLAB_RUNNER_TOKEN` to the token that you obtained, and the [variables here](#common_variables) to the values that you had performed the registration with.

Otherwise, leave `GITLAB_NEEDS_REGISTRATION` empty and:
- set `GITLAB_RUNNER_TOKEN` to the registration token, and the [variables here](#common_variables) to the values you intend to perform a registration with

Assumes a volume is mounted at `/home/gitlab-runner/cache`.

## Common variables

- `GITLAB_RUNNER_NAME`: this is passed as `--name` to `gitlab-runner register` / sets the `name` field in `[[runners]]`
- `GITLAB_RUNNER_TAGS`: this is passed as `--tags` / unused in `[[runners]]`
- `GITLAB_RUNNER_URL`: this is passed as `--url` / the `url` field in `[[runners]]`
