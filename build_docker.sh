#!/bin/bash
set -e

docker build --rm -t kungfu.azurecr.io/mw-megatron-deepspeed:latest -f ./docker/Dockerfile .

docker push kungfu.azurecr.io/mw-megatron-deepspeed:latest
