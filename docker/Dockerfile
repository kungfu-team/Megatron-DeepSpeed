#!/usr/bin/env -S sh -c 'docker build --rm -t kungfu.azurecr.io/mw-megatron-deepspeed:latest -f $0 .'

FROM kungfu.azurecr.io/mw-deepspeed-baseline:latest

EXPOSE 6000

# PIP

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
        --disable-pip-version-check \
        --no-cache-dir \
        --no-build-isolation \
        --config-settings "--build-option=--cuda_ext" \
        --config-settings "--build-option=--cpp_ext" .

# Megatron-LM requirements
RUN pip install pybind11 \
        six \
        regex \
        tensorboard

# DeepSpeedExamples
RUN mkdir -p Megatron-DeepSpeed
ADD . /workspace/Megatron-DeepSpeed
WORKDIR /workspace/Megatron-DeepSpeed
