import codecs
import re
import sys
import json
from lib.text_tool import *

inputf=sys.argv[1]
print(inputf+': clean text')
#remove emoji, <sline>.*?</sline>, Wide UCS-4 build

EMOJI_REX=re.compile(u'['
                     u'\U0001F300-\U0001F64F'
                     u'\U0001F680-\U0001F6FF'
                     u'\u2600-\u26FF\u2700-\u27BF]+',
                     re.UNICODE)
data=json.load(open('./tmp/'+inputf+'.json','r', encoding="ISO-8859-1"))
inps=[]
outs=[]

for i,d in enumerate(data):
   for i2,inp in enumerate(d[3]): #入力文章
      # 訂正後文章
      tmp=d[4][i2]
      out=""
      if len(tmp) == 0:
         out=inp
      else:
         out=tmp[-1]
         if sys.getsizeof(out)==0:
            out=inp
         else:
            out=re.sub("<sline>.*?</sline>","",out)
      inp=sep_word(EMOJI_REX.sub(r"",inp).encode('utf-8').decode('utf-8'))
      out=sep_word(EMOJI_REX.sub(r"",out).encode('utf-8').decode('utf-8'))
      if inp and out:
         inps.append(inp)
         outs.append(out)
   sys.stdout.write("\rstatus: {0:.2f}% \r".format(i/len(data)*100))
   sys.stdout.flush()

save_list(inps,'./tmp/'+inputf+'.in')
save_list(outs,'./tmp/'+inputf+'.out')
