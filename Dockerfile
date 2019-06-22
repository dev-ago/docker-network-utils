FROM alpine:latest

MAINTAINER Antony Goetzschel <mail@ago.dev>

# Updating packages
RUN apk update

# Upgrading OS
RUN apk upgrade

# Installing packages
RUN apk add --no-cache \
        iputils \
        curl \
        net-tools \
        nmap \
        netcat-openbsd \
        jq \
        busybox-extras \
        vim \
        bash

# Removing apk list and caches
RUN rm -f /var/lib/apk/lists/*

#Copy the Dockerfile for verification
COPY Dockerfile /Dockerfile

# Labels
LABEL org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/dev-ago/docker-network-utils"

# Entrypoint or Command
CMD ["/bin/bash"]