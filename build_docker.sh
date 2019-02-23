#!/usr/bin/env bash

# Definitions
repo=program-fpga
org=jesusvasquez333

# Use the git tag to tag the docker image
tag=$(git describe --tags --always --dirty)

# Build the docker and tagged it with the application version
docker build -t ${org}/${repo} .
docker tag ${org}/${repo} ${org}/${repo}:${tag}
printf "Docker image created: ${org}/${repo}:${tag}\n"
