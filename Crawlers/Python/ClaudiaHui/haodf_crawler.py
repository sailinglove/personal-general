from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import json

relative_path = "Crawlers\\Python\\ClaudiaHui"
name = "haodf"

target_file = open(relative_path + name + ".json", "r")

result = {}

# Head
driver = webdriver.Chrome()
# Headless
# option = webdriver.ChromeOptions()
# option.add_argument('headless')
# driver = webdriver.Chrome(chrome_options=option)

