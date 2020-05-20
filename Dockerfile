FROM node:12-stretch-slim

# for adding a repository: curl, ca-certificates, gnupg
# for node-gyp: python3, make, g++
# for envsubst: gettext
RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    curl \
    ca-certificates \
    gnupg \
    python3 \
    make \
    g++ \
    gettext \
  && rm -rf /var/lib/apt/lists/*

# Source: https://docs.gitlab.com/runner/install/linux-repository.html#installing-the-runner
RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | bash \
  && apt-get install --no-install-recommends -y gitlab-runner \
  && rm -rf /var/lib/apt/lists/*

RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary" | \
  (cd /usr/local/bin && tar xz)

COPY config.toml.tmpl /opt/src/
COPY prepare.sh /opt/src/

ENTRYPOINT []
CMD ["/bin/sh", "/opt/src/prepare.sh"]
