from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import json

target_site = open("target.txt", "r").readline()

driver = webdriver.Chrome()

urls = []

driver.get(target_site)

element = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, "//div[@class='header times']/p")))

def getPageResults():
    for j in range(1, 51):
        try:
            urls.append(driver.find_element_by_xpath("//a[@class='outside' and " + str(j) + "]").get_attribute("href"))
        except Exception:
            urls.append(driver.find_element_by_xpath("//a[@class='outside' and " + str(j) + "]").get_attribute("href"))
    # a_elems = driver.find_elements_by_xpath("//a[@class='outside']")
    # for elem in a_elems:
    #     urls.append(elem.get_attribute("href"))
    print("page done")

getPageResults()

no_of_results = int(element.text[:4])

for i in range(no_of_results // 50):
    print(i)
    n_target_site = target_site + "&p=" +str(i + 2)
    print(n_target_site)
    driver.get(n_target_site)
    WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, "//a[@class='outside']")))
    getPageResults()

with open("en.json", "w") as f_obj:
    json.dump(urls, f_obj)

driver.quit()