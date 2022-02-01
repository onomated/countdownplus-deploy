##### Deploy release #######
# Loosely based on https://hexdocs.pm/phoenix/releases.html#containers

# Find eligible builder and runner images on Docker Hub. We use Ubuntu/Debian instead of
# Alpine to avoid DNS resolution issues in production.
#
# https://hub.docker.com/r/hexpm/elixir/tags?page=1&name=ubuntu
# https://hub.docker.com/_/ubuntu?tab=tags
#
#
# This file is based on these images:
#
#   - https://hub.docker.com/r/hexpm/elixir/tags - for the build image
#   - https://hub.docker.com/_/debian?tab=tags&page=1&name=bullseye-20210902-slim - for the release image
#   - https://pkgs.org/ - resource for finding needed packages
#   - Ex: hexpm/elixir:1.12.2-erlang-24.0.5-debian-bullseye-20210902-slim
#

ARG RUNNER_IMAGE="debian:bullseye-20210902-slim"

FROM ${RUNNER_IMAGE}

# Install app dependencies
RUN apt-get update -y && apt-get install -y libstdc++6 openssl libncurses5 libical3 locales \
  && apt-get clean && rm -f /var/lib/apt/lists/*_*

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

EXPOSE 4000
ENV PORT=4000 \
  MIX_ENV=prod \
  SHELL=/bin/bash

# Copy app release from build state. See release name in mix.exs
WORKDIR /app
RUN chown nobody /app
COPY --chown=nobody:root release/countdownplus_app ./

USER nobody

CMD ["/app/bin/prod"]