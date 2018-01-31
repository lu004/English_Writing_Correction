#!/bin/bash
source setting.sh

echo "** test"
#exp="exp.txt"
exp="exp_`date +"%m%d_%H%M"`.txt"
$M2SCORE/scripts/edit_creator.py --ignore_whitespace_casing \
    $DATA/$test.in $DATA/$test.out \
    >$RESULT/$test.m2
$MOSES/bin/moses -f $MOSES_INI \
    <$DATA/$test.in \
    >$RESULT/$test.in.infer
$M2SCORE/m2scorer \
    $RESULT/$test.in.infer $RESULT/$test.m2 \
    >$RESULT/$exp

echo -e "$mer_para\n" >> $RESULT/$exp
cat $MOSES_INI >> $RESULT/$exp
