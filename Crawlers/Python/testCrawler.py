from selenium import webdriver
from selenium.webdriver.common.keys import Keys

search_result_page = "https://www.baidu.com/s?wd=" + "冶金人物 site:csteelnews.com" + "&ie=utf-8"
no_of_results = 1
xmlPath = "//div[@id='" + str(no_of_results) + "']/h3/a"
new_url = ""
output_file = open("Crawlers\Python\BaiduResultCrawler.txt", "wt")
 
driver = webdriver.Chrome()
driver.get(search_result_page)
elem = driver.find_element_by_xpath(xmlPath)
url = elem.get_attribute("href")
driver.get(url)
new_url = driver.current_url
driver.back()
output_file.write(new_url + '\n')
driver.quit()
print(new_url)