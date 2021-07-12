from selenium import webdriver
driver = webdriver.Chrome()
driver.get("https://www.haodf.com/doctor/1013224538.html")
print(driver.find_element_by_xpath("//span[@class='per-sta-data js-total-new-pv']").text.replace(",","")[:-1])