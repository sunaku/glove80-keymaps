#!/bin/sh -eu
#
# Usage: ./rake [ARGUMENT_FOR_RAKE...]
# ENVar: DOCKER='docker' # or 'podman'
#
# Runs rake(1) inside a Docker image.
#
# Written in 2022 by Suraj N. Kurapati

: ${DOCKER:=docker}
IMAGE=${PWD##*/}:$(git hash-object Dockerfile)

# build the image if necessary
$DOCKER images -q "$IMAGE" | grep -q . ||
  tar -cf- Dockerfile |
    $DOCKER build -t "$IMAGE" -

# run rake(1) inside the image
$DOCKER run --rm \
  $(
    case $DOCKER in
      (podman) echo --userns=keep-id ;;
      (docker) echo -u $(id -u):$(id -g) ;;
    esac
  ) \
  -v "$PWD:/opt:Z" \
  -it "$IMAGE" \
    rake "$@"
