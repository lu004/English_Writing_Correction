import sys
from lib.text_tool import sep_word,save_list
from lib.lang_tool import spell_corr,grammar_check
from lib.check_len import check_len

inputf=sys.argv[1]
print(inputf+': spell_correct,grammar_check')
inp=open('./tmp/'+inputf+'.in').read().splitlines()
out=open('./tmp/'+inputf+'.out').read().splitlines()
inp2=[]
out2=[]
w_inp=[]
w_out=[]

for i in range(len(out)):
   tmp=spell_corr(out[i])
   if check_len(inp[i],tmp) and grammar_check(tmp):
      inp2.append(inp[i].lower())
      out2.append(sep_word(tmp).lower())
   else:
      w_inp.append(inp[i])
      w_out.append(tmp)
   sys.stdout.write("\rstatus: {0:.2f}% \r".format(i/len(out)*100))
   sys.stdout.flush()

save_list(inp2,'./tmp/'+inputf+'.in')
save_list(out2,'./tmp/'+inputf+'.out')
save_list(w_inp,'./tmp/'+inputf+'_wrong.in')
save_list(w_out,'./tmp/'+inputf+'_wrong.out')
