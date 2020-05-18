FROM node:12-stretch

# Source: https://docs.gitlab.com/runner/install/linux-repository.html#installing-the-runner
RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | bash \
  && apt-get install --no-install-recommends -y gitlab-runner \
  && rm -rf /var/lib/apt/lists/*

# Source: https://docs.cloudfoundry.org/cf-cli/install-go-cli.html#pkg-linux
RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add - \
  && echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list \
  && apt-get update \
  && apt-get install --no-install-recommends -y cf-cli \
  && rm -rf /var/lib/apt/lists/*

# for envsubst
RUN apt-get update \
  && apt-get install --no-install-recommends -y \
   gettext \
  && rm -rf /var/lib/apt/lists/*

COPY config.toml.tmpl /opt/src/
COPY prepare.sh /opt/src/

ENTRYPOINT []
CMD ["/bin/sh", "/opt/src/prepare.sh"]
