from selenium import webdriver
from selenium.webdriver.common.keys import Keys
 
driver = webdriver.Chrome()
driver.get("https://www.baidu.com/s?wd=" + "冶金人物 site:csteelnews.com" + "&ie=utf-8")
# assert "Python" in driver.title
elem = driver.find_element_by_xpath("//div[@id='1']/h3/a")
url = elem.get_attribute("href")
driver.get(url)
new_url = driver.current_url
driver.quit()
print(new_url)