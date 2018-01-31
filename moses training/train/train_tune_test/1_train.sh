#!/bin/bash
source setting.sh

echo -e "** language model training"
rm -rf $MODEL/*
$MOSES/bin/lmplz -o 5 -S 80% -T /tmp \
	<$DATA/$lm \
	>$MODEL/$lm.arpa

echo -e "** translation model training"
$MOSES/scripts/training/train-model.perl \
	--root-dir $MODEL \
	--corpus $DATA/$train \
	--f "in" \
	--e out \
	--lm 0:5:$MODEL/$lm.arpa \
	--external-bin-dir $MOSES/tools

