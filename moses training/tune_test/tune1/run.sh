#!/bin/bash
source setting.sh

# for i in {0,1}; do
# 	source 1_tune.sh ${tune_set[$i]}
# 	source 2_test.sh ${test_set[$i]}
# done

#1
for i in {0,1}; do
	source 2_test.sh ${test_set[$i]}
done
# #2
for i in {0,1}; do
	source 2_test2.sh ${test_set[$i]}
done
# #3
for i in {0,1}; do
	source 2_test3.sh ${test_set[$i]}
done
