#!/bin/bash
CUR=$(cd $(dirname $0) && pwd)
DATA="/Users/lu/Desktop/data"
RESULT="$CUR/result"
TUNING="$CUR/tune"
MODEL="$CUR/model"
MOSES_INI="$MODEL/model/moses.ini"
MOSES="/Users/lu/Desktop/tool/moses"
M2SCORE="/Users/lu/Desktop/tool/m2scorer"

train="for_test"
lm="$train.out"
tune="for_test"
test="for_test"

# tune setting,M2score
mer_para="--sctype M2SCORER --scconfig beta:0.5"

