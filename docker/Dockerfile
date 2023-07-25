#!/usr/bin/env -S sh -c 'docker build --rm -t kungfu.azurecr.io/mw-megatron-deepspeed:latest -f $0 .'

FROM kungfu.azurecr.io/mw-deepspeed-baseline:latest

# Apex
WORKDIR /workspace
RUN pip install cxxfilt \
        tqdm \
        PyYAML \
        pytest \
        packaging
RUN git clone https://github.com/NVIDIA/apex && \
    cd apex && \
    git checkout 23.05 && \
    pip install -v \
        --no-cache-dir \
        --global-option="--cpp_ext" --global-option="--cuda_ext" .

# Megatron-LM requirements
RUN pip install pybind11 \
        six \
        regex \
        tensorboard

# DeepSpeedExamples
RUN mkdir -p Megatron-DeepSpeed
ADD . /workspace/Megatron-DeepSpeed
WORKDIR /workspace/Megatron-DeepSpeed
