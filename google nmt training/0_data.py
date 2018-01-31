import sys
from lib.text_tool import *

def get_voc(data,tg,loc,loc2):
   w={}
   w['<unk>']=1
   w['<s>']=1
   w['</s>']=1
   for i in open(loc+'/'+data+tg).read().splitlines():
      for k in i.split(' '):
         w[k]=1
   w.pop('') # remove ''
   save_list(list(w.keys()),loc2+'/'+data+'.voc'+tg)

if __name__ == '__main__':
   print('get voc')
   data=sys.argv[1]
   loc=sys.argv[2]
   loc2=sys.argv[3]
   get_voc(data,'.in',loc,loc2)
   get_voc(data,'.out',loc,loc2)
