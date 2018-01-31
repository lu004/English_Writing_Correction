#!/bin/bash
source setting.sh

rm -rf $MODEL/*
cd $GMT
python -m nmt.nmt \
    --attention=scaled_luong \
    --src="in" --tgt="out" \
    --vocab_prefix=$RESULT/$voc  \
    --train_prefix=$DATA/$train \
    --dev_prefix=$DATA/$dev  \
    --test_prefix=$DATA/$test \
    --out_dir=$MODEL \
    --num_train_steps=1000 \
    --steps_per_stats=100 \
    --num_layers=2 \
    --num_units=128 \
    --dropout=0.2 \
    --metrics=bleu

cd $CUR