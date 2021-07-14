from selenium import webdriver
from selenium.common import exceptions as E
# import csv
from os import path
import json

relative_path = "Crawlers\\Python\\ClaudiaHui\\results\\"
name = "haodf_result-"

result = {}

# Head
# driver = webdriver.Chrome()
# Headless
option = webdriver.ChromeOptions()
option.add_argument('headless')
driver = webdriver.Chrome(chrome_options=option)
# driver.set_page_load_timeout(10)


# get province
province_links = {}
driver.get("https://www.haodf.com/yiyuan/beijing/list.htm")

for province in driver.find_elements_by_xpath("//*[@id='el_tree_1000000']/div/a"):
    province_links[province.text] = {"link": province.get_attribute("href"), "cities": {}}
print(province_links)

for province in province_links.keys():
    for city in driver.find_elements_by_xpath("//div[@class='m_title_green']"):
        