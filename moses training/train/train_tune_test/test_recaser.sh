#!/bin/bash
source setting.sh

# true casing
echo -e "** true casing"
$MOSES/scripts/recaser/train-recaser.perl  \
--dir $RESULT \
--corpus $DATA/$train.in


$MOSES/scripts/recaser/recase.perl \
-- moses $MOSES \
-- model $RESULT/moses.ini \
--in $RESULT/$train.in.low \
>$RESULT/$train.in.low.recase

