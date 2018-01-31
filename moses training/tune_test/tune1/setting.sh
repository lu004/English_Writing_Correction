#!/bin/bash
CUR=$(cd $(dirname $0) && pwd)
RESULT="$CUR/result"
TUNE_DIR="$CUR/tune"
DATA="/Users/lu/Desktop/data/test"
MODEL="/Users/lu/Desktop/model/20180127"
MOSES_INI="$MODEL/model/moses.ini"
MOSES="/Users/lu/Desktop/tool/moses_codec"
M2SCORE="/Users/lu/Desktop/tool/m2scorer"

test_set=("native1" "native2")
tune_set=("native2" "native1")
