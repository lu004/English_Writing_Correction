#!/bin/bash
source setting.sh

echo -e "** language model training"
mkdir $model
#rm -rf $MODEL/*
$moses/bin/lmplz -o 5 -S 80% -T /tmp \
	<$data/$lm \
	>$model/$lm.arpa

echo -e "** translation model training"
$moses/scripts/training/train-model.perl \
	--root-dir $model \
	--corpus $data/$train \
	--f "in" \
	--e out \
	--lm 0:5:$model/$lm.arpa \
	--external-bin-dir $moses/tools
