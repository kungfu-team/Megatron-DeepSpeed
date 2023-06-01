#!/usr/bin/env -S sh -c 'docker build --rm -t kungfu.azurecr.io/mw-megatron-deepspeed:latest -f $0 .'

FROM kungfu.azurecr.io/mw-deepspeed-tenplex:latest

EXPOSE 6000

# User
USER root

# Apex
WORKDIR /workspace
RUN git clone https://github.com/NVIDIA/apex
RUN cd apex && \
    pip install -v --disable-pip-version-check --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./

# SSH setups
ADD docker/ssh /root/.ssh/
RUN service ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd", "-e", "-D"]

RUN chown root:root /root
RUN chmod 600 /root/.ssh/*

# PIP
RUN pip install pybind11 \
        six \
        regex \
        tensorboard

# DeepSpeedExamples
RUN mkdir -p Megatron-DeepSpeed
ADD . /workspace/Megatron-DeepSpeed
WORKDIR /workspace/Megatron-DeepSpeed
