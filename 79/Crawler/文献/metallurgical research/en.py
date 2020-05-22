
from selenium import webdriver
import time
import re
import json
import datetime
import random
import re
from urllib.request import urlretrieve
driver = webdriver.Chrome()
driver.get("https://link.springer.com/search?query=&search-within=Journal&facet-journal-id=11663")
time.sleep(2)

all_html = driver.page_source

while (1):
	print("___________________________")
	with open('en.json') as f_obj:
		all_url = json.load(f_obj)
		urls = re.findall(r'/article/[0-9a-z-./]*', driver.page_source, re.I)
		for url in urls:
			if url != '':
				if url in all_url:
					pass
				else:
					all_url.append(url)
					print(url)
	with open('en.json', 'w') as f_obj:
		json.dump(all_url, f_obj)

