#!/bin/bash
cur=$(cd $(dirname $0) && pwd)
data="$cur/data"
tmp="$cur/tmp"

inputf=$1
echo "$inputf: clean json"
#改行マーク,色編集タグを削除,訂正タグ
LF=$'\\\x0A'
COLOR_PATTERN="(\[(f|\/f)\-(red|blue|gray|bold)\])"
SLINE_PATTERN_START="\[sline\]"
SLINE_PATTERN_END="\[\/sline\]"
#Json不正パターン修正 ][num,num
BRACKETS_PATTERN="\]\[([0-9]+,[0-9]+)"
HEADER_NUM_PATTERN="\[([0-9]+,[0-9]+)"
NULL_PATTERN="(\, *null)|(null *\,)|(null)"

awk -v blank_word="" -v right_bracket="],${LF}[9,9" -v sline_start="<sline>" -v sline_end="</sline>" -v header_num="[9,9" \
	'{  gsub(/'"$COLOR_PATTERN"'/,"");
		gsub(/'"$NULL_PATTERN"'/,"");
		gsub(/'"$HEADER_NUM_PATTERN"'/,"[9,9");
		gsub(/'"$SLINE_PATTERN_START"'/,"<sline>"); 
		gsub(/'"$SLINE_PATTERN_END"'/,"</sline>"); 
		gsub(/'"$BRACKETS_PATTERN"'/,right_bracket); print; }' \
	$data/$inputf \
	>$tmp/$inputf.json
