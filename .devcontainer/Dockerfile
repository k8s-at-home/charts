# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.154.0/containers/ruby/.devcontainer/base.Dockerfile

# [Choice] Ruby version: 2, 2.7, 2.6, 2.5
ARG VARIANT="2"
FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-${VARIANT}

ENV DEBIAN_FRONTEND=noninteractive

COPY Gemfile /tmp/Gemfile

RUN \
  apt-get update \
  && \
  apt-get -y install --no-install-recommends \
    jq \
    libjq-dev \
    libonig-dev \
    gnupg2 \
  && \
  sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin \
  && \
  curl -fsSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | /bin/bash - \
  && \
  bundle config set system 'true' \
  && bundle install --gemfile /tmp/Gemfile \
  && rm /tmp/Gemfile
