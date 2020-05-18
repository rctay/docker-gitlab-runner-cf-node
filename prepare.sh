set -e
envsubst '${GITLAB_RUNNER_TOKEN},${GITLAB_RUNNER_NAME}' < /opt/src/config.toml.tmpl > /etc/gitlab-runner/config.toml
echo Starting runner with config:
cat /etc/gitlab-runner/config.toml
chown gitlab-runner:gitlab-runner /home/gitlab-runner/cache
gitlab-runner run --user=gitlab-runner working-directory=/home/gitlab-runner
