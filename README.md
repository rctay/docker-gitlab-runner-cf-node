# gitlab-runner-node-cf

An image installed with:
- [node 12](https://github.com/nodejs/docker-node/blob/master/12/stretch/Dockerfile)
- the [cf](https://docs.cloudfoundry.org/cf-cli/install-go-cli.html#pkg-linux) CLI
- [gitlab-runner](https://docs.gitlab.com/runner/install/linux-repository.html#installing-the-runner)

## Usage
 
- Environment variables:
  - `GITLAB_RUNNER_TOKEN`
  - `GITLAB_RUNNER_NAME`
- Assumes a volume is mounted at `/home/gitlab-runner/cache`
