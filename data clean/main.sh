#!/bin/bash
cur=$(cd $(dirname $0) && pwd)
data="$cur/data"
output="$cur/output"
tmp="$cur/tmp"
aws_s3="s3://espire-models"
file_set=('lang8-1' 'lang8-2' 'lang8-3')
#file_set=('lang8-1')

for file in ${file_set[@]}; do
	source 1_clean_json.sh $file
	python 2_clean_text.py $file
	python 3_spell_grammar_length.py $file
done

#merge files
for file in ${file_set[@]}; do
    cat $tmp/$file.in >> $output/data.in
    cat $tmp/$file.out >> $output/data.out
    cat $tmp/"$file"_wrong.in >> $output/data_error.in
    cat $tmp/"$file"_wrong.out >> $output/data_error.out 
done
