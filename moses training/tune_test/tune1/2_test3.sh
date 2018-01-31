#!/bin/bash
source setting.sh

test=$1
echo "test3: $test"
exp="$RESULT/exp_lang_moses_`date +"%m%d_%H%M"`.txt"

#infer
python spell_corr.py $test.in
$MOSES/bin/moses -f $MOSES_INI \
    <$RESULT/$test.in.corr \
    >$RESULT/$test.in.corr.infer
    
source m2score_cnt.sh $test.in.corr.infer $test $exp
echo -e "langtool->moses" >> $exp
echo -e "$test\n $mer_para\n $MOSES_INI" >> $exp
