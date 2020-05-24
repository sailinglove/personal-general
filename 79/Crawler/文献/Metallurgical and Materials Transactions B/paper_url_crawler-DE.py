from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import json

target_site = open("target.txt", "r").readline()
target_site_1 = target_site[:38]
target_site_2 = target_site[38:]

# Headless chrome - more efficient
option = webdriver.ChromeOptions()
option.add_argument('headless')
driver = webdriver.Chrome(chrome_options=option)
# Normal chrome - human readable testing
# driver = webdriver.Chrome()

urls = []
print(target_site_1 + "1" + target_site_2)
driver.get(target_site_1 + "1" + target_site_2)

no_of_results_str = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, "//h1[@id='number-of-search-results-and-search-terms']/strong"))).text

def getPageResults():
    for j in range(1, 51):
        try:
            urls.append(driver.find_element_by_xpath("//a[@class='title' and " + str(j) + "]").get_attribute("href"))
        except Exception:
            urls.append(driver.find_element_by_xpath("//a[@class='title' and " + str(j) + "]").get_attribute("href"))
    # a_elems = driver.find_elements_by_xpath("//a[@class='outside']")
    # for elem in a_elems:
    #     urls.append(elem.get_attribute("href"))
    print("page done")

getPageResults()

no_of_results = int(no_of_results_str[:1] + no_of_results_str[2:])
print(no_of_results)

for i in range(no_of_results // 50):
    print(i)
    n_target_site = target_site_1 + str(i + 2) + target_site_2
    print(n_target_site)
    driver.get(n_target_site)
    WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, "//a[@class='title']")))
    getPageResults()

with open("DE.json", "w") as f_obj:
    json.dump(urls, f_obj)

driver.quit()