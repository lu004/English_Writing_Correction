#!/bin/bash
source setting.sh

test=$1
echo "test2: $test"
exp="$RESULT/exp_lang_`date +"%m%d_%H%M"`.txt"

#infer
python spell_corr.py $test.in
    
source m2score_cnt.sh $test.in.corr $test $exp
echo -e "langtool" >> $exp
echo -e "$test\n $mer_para\n $MOSES_INI" >> $exp
