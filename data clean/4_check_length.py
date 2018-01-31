import sys
from lib.text_tool import *
from lib.lang_tool import *

def check_len(sen1,sen2):
   t=len(word_tokenize(sen1));
   t2=len(word_tokenize(sen2))
   re=(t>=3 and t2>=3)
   return re

inp=open('./output/data3.in').read().splitlines()
out=open('./output/data3.out').read().splitlines()
inp2=[]
out2=[]

for i in range(len(inp)):
   if check_len(inp[i],out[i]):
      inp2.append(inp[i])
      out2.append(out[i])
save_list(inp2,'./output/data3_3.in')
save_list(out2,'./output/data3_3.out')
