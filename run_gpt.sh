#! /bin/bash

DATA_PATH="/data/gpt/enwiki/data_text_document"
CHECKPOINT_PATH="/data/ckpt"

torchrun \
    --nnodes=1:16 \
    --nproc-per-node=4 \
    --max-restarts=3 \
    --rdzv-id=deepspeed-rdvz \
    --rdzv-backend=c10d \
    --rdzv-endpoint=komodo01.doc.res.ic.ac.uk:29400 \
    pretrain_gpt.py \
        --num-layers 24 \
        --hidden-size 1024 \
        --num-attention-heads 16 \
        --micro-batch-size 8 \
        --global-batch-size 64 \
        --seq-length 1024 \
        --max-position-embeddings 1024 \
        --train-iters 500000 \
        --lr-decay-iters 320000 \
        --save $CHECKPOINT_PATH \
        --load $CHECKPOINT_PATH \
        --data-path $DATA_PATH \
        --vocab-file "/data/gpt/gpt2-vocab.json" \
        --merge-file "/data/gpt/gpt2-merges.txt" \
        --data-impl mmap \
        --split 949,50,1 \
        --distributed-backend nccl \
        --lr 0.00015 \
        --lr-decay-style cosine \
        --min-lr 1.0e-5 \
        --weight-decay 1e-2 \
        --clip-grad 1.0 \
        --lr-warmup-fraction .01 \
        --checkpoint-activations \
        --log-interval 10 \
        --save-interval 100 \
        --eval-interval 1000 \
        --eval-iters 10 \
        --fp16 \
        --pipeline-model-parallel-size 1
