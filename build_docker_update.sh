#!/bin/bash
set -e

docker build --rm -t kungfu.azurecr.io/mw-megatron-deepspeed-update:latest -f ./docker/Dockerfile-update .

docker push kungfu.azurecr.io/mw-megatron-deepspeed-update:latest
