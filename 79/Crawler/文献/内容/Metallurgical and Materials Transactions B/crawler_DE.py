from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import urllib.request
import urllib.error
import json

name = "DE"

target_file = open("79\\Crawler\\文献\\内容\\Metallurgical and Materials Transactions B\\" + name + ".json", "r")
target_json = target_file.read()
target_file.close()
target_sites = json.loads(target_json)

result = {}
count = 0
total = str(len(target_sites))

# Head
# driver = webdriver.Chrome()
# Headless
option = webdriver.ChromeOptions()
option.add_argument('headless')
driver = webdriver.Chrome(chrome_options=option)

for site in target_sites:
    count += 1
    temp = {}
    driver.get(site)
    try:
        temp['title'] = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, "//h1[@class='c-article-title']"))).text
        authors = []
        authors_elem = driver.find_elements_by_xpath("//a[@data-test='author-name']")
        for author_elem in authors_elem:
            authors.append(author_elem.text)
        temp['authors'] = authors
        addresses = []
        addresses_elem = driver.find_elements_by_xpath("//span[@class='c-article-author-affiliation__address']")
        for address_elem in addresses_elem:
            addresses.append(address_elem.text)
        temp['addresses'] = addresses
        temp['abstract'] = driver.find_element_by_xpath("//div[@id='Abs1-content']/p").text
        temp['citation'] = driver.find_element_by_xpath("//p[@class='c-bibliographic-information__citation']").text
    except:
        pass
    print(temp)
    print(site)
    result[site] = temp
    print(str(count) + " site of " + total + " completed")

driver.quit()

with open("79\\Crawler\\文献\\内容\\Metallurgical and Materials Transactions B\\" + "result_" + name + ".json", "w") as f:
    json.dump(result, f)
    f.close()