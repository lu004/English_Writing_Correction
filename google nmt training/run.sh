#!/bin/bash
source setting.sh

python 0_data.py $train $DATA $RESULT
source 1_train.sh
source 2_test.sh
