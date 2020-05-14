from selenium import webdriver

search_item = "冶金人物 site:csteelnews.com"
search_result_page = "https://www.baidu.com/s?wd=" + search_item + "&ie=utf-8"
driver = webdriver.Chrome()
output_file = open("Crawlers/Python/BaiduResultCrawler.txt", "wt")

def itemCrawle(num):
  xmlPath = "//div[@id='" + str(num) + "']/h3/a"
  elem = driver.find_element_by_xpath(xmlPath)
  driver.get(elem.get_attribute("href"))
  result_url = driver.current_url
  output_file.write(result_url)

def pageCrawle(num):
  for i in range(10):
    itemCrawle(num * 10 + i + 1)
    output_file.write("\n")
    driver.back()

def nextPage(num):
  next_page_xpath = "//div[@id='page']//span[contains(text(), '" + str(num) + "')]/parent::a"
  next_page_url = driver.find_element_by_xpath(next_page_xpath)
  driver.get(next_page_url.get_attribute("href"))

driver.get(search_result_page)
for i in range(4):
  pageCrawle(i)
  nextPage(i + 2)
output_file.close()
driver.quit()