#!/bin/bash
CUR=$(cd $(dirname $0) && pwd)
DATA="/Users/lu/Desktop/data"
RESULT="$CUR/result"
MODEL="$CUR/model"
GMT="/Users/lu/Desktop/tool/gnmt"
M2SCORE="/Users/lu/Desktop/tool/m2scorer"

train="data3"
dev="native1"
test="native1"
voc="$train.voc"
