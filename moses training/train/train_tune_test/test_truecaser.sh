#!/bin/bash
source setting.sh

# truecaser
echo -e "** true casing"
# $MOSES/scripts/recaser/train-truecaser.perl \
# --model $RESULT/$train.in.true_mo \
# --corpus $DATA/$train.in

# $MOSES/scripts/recaser/truecase.perl \
# --model $RESULT/$train.in.true_mo \
# <$DATA/$train.in \
# >$RESULT/$train.in.true


$MOSES/scripts/tokenizer/lowercase.perl \
<$DATA/$train.in \
>$RESULT/$train.in.low

$MOSES/scripts/recaser/truecase.perl \
--model $RESULT/$train.in.true.mo \
<$RESULT/$train.in.low \
>$RESULT/$train.in.low.true


# $MOSES/scripts/recaser/detruecase.perl \
# <$RESULT/$train.in.true \
# >$RESULT/$train.detrue
