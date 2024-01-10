#!/bin/sh -eu
#
# Usage: ./rake [ARGUMENT_FOR_RAKE...]
#
# Runs rake(1) inside a Docker image.
#
# Written in 2022 by Suraj N. Kurapati

IMAGE=${PWD##*/}

# build the image if necessary
docker images -q "$IMAGE" | grep -q . ||
  tar -cf- Dockerfile |
    docker build -t "$IMAGE" -

# run rake(1) inside the image
docker run -v "$PWD:/opt" --rm -it "$IMAGE" \
  env CHOWN=$(id -u):$(id -g) \
    sh -uc '
      rake "$@"
      status=$?
      find . -user root -exec chown $CHOWN {} \;
      exit $status
    ' _ "$@"
