import sys
from lib.text_tool import *

def check_len(sen1,sen2):
   t=len(word_tokenize(sen1))
   t2=len(word_tokenize(sen2))
   re=t>0 and t2>0 \
      and ((abs(t-t2)<=5) or (max(t,t2)/min(t,t2)<4))
   return re
