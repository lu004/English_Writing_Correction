#!/bin/bash
source setting.sh
exp="$RESULT/exp_gmt_`date +"%m%d_%H%M"`.txt"

echo "infer"
cd $GMT
python -m nmt.nmt \
	--out_dir=$MODEL \
	--inference_input_file=$DATA/$test.in \
	--inference_output_file=$RESULT/$test.in.infer

cd $CUR
source m2score_cnt.sh $test.in.infer $test $exp 
