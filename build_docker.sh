#!/bin/bash
set -e

# docker build --progress=plain --no-cache --rm -t kungfu.azurecr.io/mw-megatron-deepspeed:latest -f ./docker/Dockerfile .
docker build --rm -t kungfu.azurecr.io/mw-megatron-deepspeed:latest -f ./docker/Dockerfile .

docker push kungfu.azurecr.io/mw-megatron-deepspeed:latest
