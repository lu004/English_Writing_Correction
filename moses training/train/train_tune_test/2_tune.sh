#!/bin/bash
source setting.sh

echo -e "** tuning: feature weight"
rm -rf $TUNING/*
$M2SCORE/scripts/edit_creator.py --ignore_whitespace_casing \
    $DATA/$tune.in $DATA/$tune.out \
    >$RESULT/$tune.m2

$MOSES/scripts/training/mert-moses.pl \
	$DATA/$tune.in $RESULT/$tune.m2 \
	$MOSES/bin/moses $MOSES_INI \
	--working-dir $TUNING \
	--mertdir $MOSES/bin \
	--mertargs="$mer_para" \
	--return-best-dev \
	--batch-mira-args '-J 300' \
	--decoder-flags '-threads 8 -v 0'
cp $TUNING/moses.ini $MODEL/model/
