#!/bin/bash
set -e

docker run \
    --gpus all \
    --name megatron-deepspeed-compile \
    -t kungfu.azurecr.io/mw-megatron-deepspeed:latest \
    python compile_kernels.py

docker commit megatron-deepspeed-compile kungfu.azurecr.io/mw-megatron-deepspeed-kernels:latest
docker push kungfu.azurecr.io/mw-megatron-deepspeed-kernels:latest
