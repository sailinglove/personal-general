import json
from selenium import webdriver

url_file = open("Crawlers/Python/BaiduResultCrawler.txt")
out_file = open("Crawlers/Python/冶金名人.json", "w")
driver = webdriver.Chrome()
ppl = {}

with url_file:
  urls = url_file.read().splitlines()

for url in urls:
  driver.get(url)
  nameElem = driver.find_element_by_xpath("//td[@class='fontbiaoti']")
  name = nameElem.text
  description = ""
  descriptionElems = driver.find_elements_by_xpath("//em")
  for desElem in descriptionElems:
    description = description + desElem.text + "\n"
  ppl[name] = description

# json.dumps(ppl)

out_file.write(json.dumps(ppl))
out_file.close()

print(ppl)

driver.quit()