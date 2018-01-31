import codecs
import os
import re
from nltk import word_tokenize

def save_list(list,file):
   if os.path.exists(file):
      os.remove(file)
   f=codecs.open(file,'w',encoding='utf8')
   for i in list:
      f.write("%s\n" % (i))
   f.close()

le_num_pat=re.compile(r"[a-zA-Z0-9,.!?;][a-zA-Z0-9,.!?;-]*$")
def sep_word(input):
   sen=""
   for w in word_tokenize(input):
      if le_num_pat.match(w):
         sen=sen+w+" "
   return sen
