from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
import json

name = "钢铁研究学报_en"

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
        # temp['title_cn'] = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, "//span[@class='J_biaoti']"))).text
        # temp['author_cn'] = driver.find_element_by_xpath("//td[@class='J_author_cn']").text
        # temp['org_cn'] = driver.find_element_by_xpath("//span[@class='J_author_dizhi']").text
        # temp['abstract_cn'] = driver.find_element_by_xpath("//span[@class='J_zhaiyao']").text
        # keywords_cn = []
        # keywords_cn_elements = driver.find_elements_by_xpath("//td/b[contains(text(),'关键词')]/../a")
        # for keyword_cn_element in keywords_cn_elements:
        #     keywords_cn.append(keyword_cn_element.text)
        # temp['keywords_cn'] = keywords_cn
    
        temp['title_en'] = WebDriverWait(driver, 3).until(EC.presence_of_element_located((By.XPATH, "//span[@class='J_biaoti_en']"))).text
        temp['author_en'] = driver.find_element_by_xpath("//td[@class='J_author_en']").text
        temp['org_en'] = driver.find_element_by_xpath("//td[@style='line-height:130%' and 1]").text
        temp['abstract_en'] = driver.find_element_by_xpath("//span[contains(text(), 'Abstract')]").text
        keywords_en = []
        keywords_en_elements = driver.find_elements_by_xpath("//span/b[contains(text(),'Key')]/../a")
        for keyword_en_element in keywords_en_elements:
            keywords_en.append(keyword_en_element.text)
        temp['keywords_en'] = keywords_en

        temp['citation'] = driver.find_element_by_xpath("//*[@id='abstract_tab_content']/table[2]/tbody/tr[2]/td").text
        temp['date'] = driver.find_element_by_xpath("//*[@id='abstract_tab_content']/table[1]/tbody/tr[6]/td").text
        temp['author_intro'] = driver.find_element_by_xpath("//*[@id='abstract_tab_content']/table[1]/tbody/tr[7]/td/span").text
    except TimeoutException:
        temp = "Faulty webpage"
    except:
        pass
    finally:
        print(temp)

        result[site] = temp

        print("Site completed")

driver.quit()

with open("result_" + name + ".json", "w") as f_obj:
    json.dump(result, f_obj)
