import requests
import time
import selenium.webdriver as webdriver
from bs4 import BeautifulSoup
import os
def cleaner(captions_tags):
    ans = []
    for cts in captions_tags:
        tags = set()
        caption = ""
        for ct in cts:
            if '@' in ct:
                ...
            elif '#' in ct:
                tags.add(ct.replace('#',''))
            else:
                caption += ct + ' '
        ans.append([caption,tags])
    return ans

def hashstr(s):
    st = ''
    for x in s:
        st += x + ' '
    return st

quotes,images,links,captions_tags = [],[],[],[]
print("Enter Usernames of the accounts to be scraped")
user_names = [ _ for _ in input().split()]
driver = webdriver.Chrome("/Users/saifkazi/Downloads/chromedriver")
ig = "https://www.instagram.com/"
f = open('data.csv','w',encoding="utf-8")
fh = open('urls.csv','w')
rows = []
urls = []
for user in user_names:
    url = ig + user
    driver.get(url)
    soup = BeautifulSoup(driver.page_source, 'html.parser')
    temp = soup.find("span","g47SY")
    n = int(temp.get_text().replace(',',''))//4
    for _ in range(5 if n > 5 else n ):
        time.sleep(1)
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
    soup = BeautifulSoup(driver.page_source, 'html.parser')
    temp = soup.find_all("div","KL4Bh")
    for t in temp:
        images.append(t.img["src"])
        try:
            quotes.append(t.img["alt"])
        except:
            quotes.append("")
    temp = soup.find_all("div","v1Nh3")
    for t in temp:
        links.append(t.a["href"])
    for link in links:
        driver.get(ig+link)
        soup = BeautifulSoup(driver.page_source, 'html.parser')
        temp = soup.find("div","C4VMK")
        a = temp.find("span").get_text()
        if a == "Verified":
            a = temp.find_all("span")[1].get_text()
        captions_tags.append(a) if temp else captions_tags.append("")
captions_tags = cleaner(captions_tags)
for i in range(len(images)):
    row = quotes[i] + "\t" + captions_tags[i][0] +  "\t" + hashstr(captions_tags[i][1]) +"\n"
    url = images[i] + "\n"
    rows.append(row)
    urls.append(url)
f.writelines(rows)
f.close()
fh = open('urls.csv','w')
fh.writelines(urls)
fh.close()
