set -e
chown gitlab-runner:gitlab-runner /home/gitlab-runner/cache
gitlab-runner register \
  --non-interactive \
  --url "$GITLAB_RUNNER_URL" \
  --registration-token "$GITLAB_RUNNER_TOKEN" \
  --executor "shell" \
  --tag-list "$GITLAB_RUNNER_TAGS"
echo Starting runner with config:
cat /etc/gitlab-runner/config.toml
gitlab-runner run --user=gitlab-runner working-directory=/home/gitlab-runner
