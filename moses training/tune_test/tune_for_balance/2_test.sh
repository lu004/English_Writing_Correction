#!/bin/bash
source setting.sh

test=$1
echo "test: $test"
exp="$RESULT/exp_moses_`date +"%m%d_%H%M"`.txt"

#infer
$MOSES/bin/moses -f $MOSES_INI \
    <$DATA/$test.in \
    >$RESULT/$test.in.infer

source m2score_cnt.sh $test.in.infer $test $exp  
echo -e "moses" >> $exp
echo -e "$test\n $mer_para\n $MOSES_INI" >> $exp
