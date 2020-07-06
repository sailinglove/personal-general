from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import urllib.request
import urllib.error
import json

name = "中国冶金"
relative_path = "79\\Crawler\\文献\\内容\\中国冶金\\"

target_file = open(relative_path + name + ".json", "r")
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
    temp = {}
    count += 1
    driver.get(site)
    try:
        temp['title_cn'] = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, "//span[@class='J_biaoti']"))).text
        artical_path = ""
        artical_path_elements = driver.find_elements_by_xpath("/html/body/table[2]/tbody/tr/td/table[1]/tbody/tr/td/descendant::a")
        for artical_path_element in artical_path_elements:
            artical_path.append(artical_path_element.text + ">>")
        artical_path.append(driver.find_element_by_xpath("/html/body/table[2]/tbody/tr/td/table[1]/tbody/tr/td/text()[4]".replace("&nbsp;", "")))
        temp['path'] = artical_path
        temp['author_cn'] = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, "/html/body/table[2]/tbody/tr/td/table[2]/tbody/tr[4]/td"))).text
        temp['org_cn'] = driver.find_element_by_xpath("/html/body/table[2]/tbody/tr/td/table[2]/tbody/tr[5]/td").text
        temp['abstract_cn'] = driver.find_element_by_xpath("//td[@class='J_zhaiyao']/b[contains(text(), '摘要')]/..").text
        keywords_cn = []
        keywords_cn_elements = driver.find_elements_by_xpath("//td[@class='J_zhaiyao']/b[contains(text(), '关键词')]/../a")
        for keyword_cn_element in keywords_cn_elements:
            keywords_cn.append(keyword_cn_element.text)
        temp['keywords_cn'] = keywords_cn
        temp['title_en'] = driver.find_element_by_xpath("//span[@class='J_biaoti_en']").text
        temp['author_en'] = driver.find_element_by_xpath("//td[@class='J_author_en']").text
        temp['org_en'] = driver.find_element_by_xpath("/html/body/table[2]/tbody/tr/td/table[2]/tbody/tr[9]/td").text
        temp['abstract_en'] = driver.find_element_by_xpath("//span[@class='J_zhaiyao']/b[contains(text(), 'Abstract')]/..").text
        keywords_en = []
        keywords_en_elements = driver.find_elements_by_xpath("//span[@class='J_zhaiyao']/b[contains(text(), 'Key')]/../a")
        for keyword_en_element in keywords_en_elements:
            keywords_en.append(keyword_en_element.text)
        temp['keywords_en'] = keywords_en
        temp['date'] = driver.find_element_by_xpath("//*[@id='abstract_tab_content']/table[1]/tbody/tr[6]/td").text
        temp['citation'] = driver.find_element_by_xpath("//*[@id='abstract_tab_content']/table[2]/tbody/tr[2]/td").text
    except:
        pass
    print(temp)
    print(site)
    result[site] = temp
    print(str(count) + " site of " + total + " completed")

driver.quit()

with open(relative_path + "result_" + name + ".json", "w") as f_obj:
    json.dump(result, f_obj)
    f_obj.close()