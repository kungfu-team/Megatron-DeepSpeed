#!/usr/bin/env -S sh -c 'docker build --rm -t kungfu.azurecr.io/mw-megatron-deepspeed:latest -f $0 .'
FROM kungfu.azurecr.io/mw-pytorch2-deepspeed:latest

WORKDIR /workspace

RUN pip install --no-cache-dir \
        # Apex
        cxxfilt \
        tqdm \
        PyYAML \
        pytest \
        packaging \
        # Megatron-LM
        six \
        regex \
        tensorboard \
        pybind11

RUN git clone https://github.com/NVIDIA/apex && \
    cd apex && \
    git checkout 23.05 && \
    pip install -v \
        --no-cache-dir \
        --global-option="--cpp_ext" \
        --global-option="--cuda_ext" . && \
    rm -r /workspace/apex

COPY . /workspace/Megatron-DeepSpeed
WORKDIR /workspace/Megatron-DeepSpeed

RUN python compile_kernels.py
