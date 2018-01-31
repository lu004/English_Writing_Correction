#!/bin/bash
source setting.sh

pred=$1
ans=$2
exp=$3
    
$M2SCORE/scripts/edit_creator.py --ignore_whitespace_casing \
    $DATA/$ans.in $DATA/$ans.out \
    >$RESULT/$ans.m2
$M2SCORE/m2scorer \
    $RESULT/$pred $RESULT/$ans.m2 \
    >>$exp
