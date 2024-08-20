#!/bin/bash
set -e

DOCKER_BUILDKIT=0 docker build --rm -t kungfu.azurecr.io/mw-megatron-deepspeed:latest -f ./docker/Dockerfile .

docker push kungfu.azurecr.io/mw-megatron-deepspeed:latest
