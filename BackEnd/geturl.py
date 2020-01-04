import pandas as pd
import requests 
import wget 
import os 
data = pd.read_csv("urls.csv",error_bad_lines=False,sep='\n',header=None)
urls = data[0]
i = 1
for url in urls:
    try:
        r = requests.get(url,allow_redirects=True)
    except:
        pass
    s = 'data' + str(i) + ".jpeg"
    open(s,"wb").write(r.content)
    i += 1