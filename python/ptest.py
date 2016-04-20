#!coding:utf8
import sys

url=sys.argv[1]

import json
from bs4 import BeautifulSoup
import mechanize

#fout5 = codecs.open('data.csv','r', encoding='utf-8', errors='replace')




#url = "https://www.linkedin.com/in/emptymalei"

op = mechanize.Browser() # use mecahnize's browser
op.set_handle_robots(False) #tell the webpage you're not a robot
op.addheaders = [('User-agent', 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.1) Gecko/2008071615 Fedora/3.0.1-1.fc9 Firefox/3.0.1')]
j = op.open(url)


soup1 = BeautifulSoup(j)
mydivs = soup1.findAll("li", { "class" : "skill" })
skills =[]
for eachli in mydivs:
    skills.append(eachli.a.span.text)
    
print json.dumps(skills)