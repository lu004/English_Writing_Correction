import sys
from lib.text_tool import sep_word,save_list
from lib.lang_tool import spell_corr,grammar_check

test=sys.argv[1]
print(test+': spell_correct')
inp=open('/Users/lu/Desktop/data/test/'+test).read().splitlines()
out=[]
for i in range(len(inp)):
   out.append(sep_word(spell_corr(inp[i])).lower())

save_list(out,'./result/'+test+'.corr')
