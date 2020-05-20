set -e
chown gitlab-runner:gitlab-runner /home/gitlab-runner/cache
if [ -z "$GITLAB_NEEDS_REGISTRATION" ]; then
  envsubst '${GITLAB_RUNNER_URL},${GITLAB_RUNNER_TOKEN},${GITLAB_RUNNER_NAME}' < /opt/src/config.toml.tmpl > /etc/gitlab-runner/config.toml
else
  gitlab-runner register \
    --non-interactive \
    --url "$GITLAB_RUNNER_URL" \
    --registration-token "$GITLAB_RUNNER_TOKEN" \
    --executor "shell" \
    --builds-dir "/home/gitlab-runner/builds" \
    --cache-dir "/home/gitlab-runner/cache" \
    --name "$GITLAB_RUNNER_NAME" \
    --tag-list "$GITLAB_RUNNER_TAGS"
fi
echo Starting runner with config:
cat /etc/gitlab-runner/config.toml
gitlab-runner run --user=gitlab-runner working-directory=/home/gitlab-runner
