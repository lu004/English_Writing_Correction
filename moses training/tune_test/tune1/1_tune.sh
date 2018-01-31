#!/bin/bash
source setting.sh
# tune setting for M2score
mer_para="--sctype M2SCORER --scconfig beta:0.6"

tune=$1
echo "tune: $tune, for feature weight"
rm -rf $TUNE_DIR/*
$M2SCORE/scripts/edit_creator.py --ignore_whitespace_casing \
    $DATA/$tune.in $DATA/$tune.out \
    >$RESULT/$tune.m2

$MOSES/scripts/training/mert-moses.pl \
	$DATA/$tune.in $RESULT/$tune.m2 \
	$MOSES/bin/moses $MOSES_INI \
	--working-dir $TUNE_DIR \
	--mertdir $MOSES/bin \
	--mertargs="$mer_para" \
	--return-best-dev \
	--batch-mira-args '-J 300' \
	--decoder-flags '-threads 8 -v 0'
cp $TUNE_DIR/moses.ini $MODEL/model/
