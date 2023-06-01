#!/bin/bash
set -e

./docker/Dockerfile

docker push kungfu.azurecr.io/mw-megatron-deepspeed:latest
