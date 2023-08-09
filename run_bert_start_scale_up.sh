#!/bin/bash

service ssh start

deepspeed \
    --num_nodes 4 \
    --num_gpus 1 \
    --master_addr worker-0 \
    --master_port=6000 \
    --elastic_training \
    --max_elastic_nodes 16 \
    --min_elastic_nodes 1 \
    --hostfile hostfiles/start_scale_up.txt \
    pretrain_bert.py \
    --override-lr-scheduler \
    --adam-beta1 0.9 \
    --adam-beta2 0.999 \
    --init-method-std 0.02 \
    --tensor-model-parallel-size 1 \
    --lr-decay-iters 1000000 \
    --lr-warmup-iters 10000 \
    --micro-batch-size 8 \
    --global-batch-size 256 \
    --num-layers 24 \
    --hidden-size 1024 \
    --num-attention-heads 16 \
    --seq-length 1024 \
    --max-position-embeddings 1024 \
    --train-iters 1000000 \
    --lr 1e-4 \
    --min-lr 1e-5 \
    --lr-decay-style linear \
    --split 949,50,1 \
    --log-interval 100 \
    --eval-interval 1000 \
    --eval-iters 10 \
    --save-interval 50 \
    --weight-decay 1e-2 \
    --clip-grad 1.0 \
    --num-workers 2 \
    --fp16 \
    --load /data/ckpt \
    --save /data/ckpt \
    --tensorboard-queue-size 1 \
    --log-timers-to-tensorboard \
    --log-batch-size-to-tensorboard \
    --log-validation-ppl-to-tensorboard \
    --tensorboard-dir /data/tensorboard \
    --log-optimizer-states-to-tensorboard \
    --vocab-file /data/bert/bert-large-uncased-vocab.txt \
    --data-path /data/bert/enwiki/my-bert_text_sentence \
    --data-impl mmap \
    --deepspeed \
    --deepspeed_config ds_config_bert_bsz256_mbsz128_log100_zero0.json \
    --zero-stage 0 \
    --pipeline-model-parallel-size 1 \
    --no-pipeline-parallel
