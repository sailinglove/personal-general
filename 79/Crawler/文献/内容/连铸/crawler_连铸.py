from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import urllib.request
import urllib.error
import json

name = "连铸"

target_file = open(name + ".json", "r")
target_json = target_file.read()
target_file.close()
target_sites = json.loads(target_json)

result = {}

# Head
# driver = webdriver.Chrome()
# Headless
option = webdriver.ChromeOptions()
option.add_argument('headless')
driver = webdriver.Chrome(chrome_options=option)

for site in target_sites:    
    temp = {}

    driver.get(site)
    
    try:
        resp = urllib.request.urlopen(site)
    except urllib.error.HTTPError as e:
        error = True
        error_code = e.code

    if error:
        temp = error_code
    else:
        try:
            temp['title_cn'] = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, "//span[@class='J_biaoti']"))).text
            temp['author_cn'] = driver.find_element_by_xpath("//td[@class='J_author_cn']").text
            temp['org_cn'] = driver.find_element_by_xpath("/html/body/table[2]/tbody/tr/td/table[2]/tbody/tr[5]/td").text
            temp['abstract_cn'] = driver.find_element_by_xpath("//span[@class='J_zhaiyao']").text
            keywords_cn = []
            keywords_cn_elements = driver.find_elements_by_xpath("//td/b[contains(text(),'关键词')]/../a")
            for keyword_cn_element in keywords_cn_elements:
                keywords_cn.append(keyword_cn_element.text)
            temp['keywords_cn'] = keywords_cn
            temp['title_en'] = driver.find_element_by_xpath("//span[@class='J_biaoti_en']").text
            temp['author_cn'] = driver.find_element_by_xpath("//td[@class='J_author_en']").text
            temp['org_cn'] = driver.find_element_by_xpath("/html/body/table[2]/tbody/tr/td/table[2]/tbody/tr[9]/td").text
            temp['abstract_en'] = driver.find_element_by_xpath("//span[@class='J_zhaiyao_en']").text
            keywords_en = []
            keywords_en_elements = driver.find_elements_by_xpath("//td/b[contains(text(),'Key')]/../a")
            for keyword_en_element in keywords_en_elements:
                keywords_en.append(keyword_en_element.text)
            temp['keywords_en'] = keywords_en
            temp['citation'] = driver.find_element_by_xpath("//td[@class='J_zhaiyao_en']").text
        except:
            pass
    
    print(temp)
    result[site] = temp
    print("Site completed")
    error = None
    error_code = None

driver.quit()

with open("result_" + name + ".json", "w") as f_obj:
    json.dump(result, f_obj)
    f_obj.close()