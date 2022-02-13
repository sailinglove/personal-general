from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from msedge.selenium_tools import EdgeOptions
from msedge.selenium_tools import Edge
from selenium.common import exceptions as E
import requests
import json

username = 'keungyamkei.study@gmail.com'
password = 'VqR9Cdct2ZQc@4Z'
link = 'education.beijing2022.cn'

# Head
# driver = webdriver.Chrome('D:\Applications\chromedriver_win32\chromedriver.exe')
# Headless
# option = webdriver.ChromeOptions()
# option.add_argument('headless')
# driver = webdriver.Chrome(chrome_options=option)

# Headed
edge_options = EdgeOptions()
edge_options.use_chromium = True
driver = Edge(options=edge_options, executable_path="D:\Applications\edgedriver_win64\MicrosoftWebDriver.exe")
# driver = webdriver.Edge()
# Headless
# edge_options = EdgeOptions()
# edge_options.use_chromium = True
# edge_options.add_argument('headless')
# driver = Edge(options=edge_options)
driver.maximize_window()





driver.get('https://education.beijing2022.cn')

# WebDriverWait(driver, 10).until(lambda d: d.find_element_by_xpath('//*[@class="iv-login"]')).click()

# driver.find_element_by_xpath("//*[@class='ivu-cascader-menu']/li[2]").click()

# driver.find_element_by_xpath("//li[contains(text(), '志愿者')]").click()

# WebDriverWait(driver, 10).until(lambda d: d.find_element_by_xpath("//input[@class='user']")).send_keys(username)
# driver.find_element_by_xpath("//input[@class='password']").send_keys(password)

# driver.find_element_by_xpath("//a[@class='login-btn']").click()

# temp_input_box = driver.find_element_by_xpath("//input[@placeholder='请输入手机动态口令']")
# otp = input('OTP: ')
# temp_input_box.send_keys(otp)
# driver.find_element_by_xpath("/html/body/div[3]/div[2]/div[3]/form/a").click()

# WebDriverWait(driver, 30).until(lambda d: d.find_element_by_xpath('//*[contains(text(), "必修课程")]/following-sibling::div'))

# cookies = driver.get_cookies()
# with open('cookies.json', 'w') as f:
#     f.write(json.dumps(cookies))

with open('cookies.json', 'r') as f:
    cookies = json.loads(f.read())
print(cookies)
for cookie in cookies:
    driver.add_cookie(cookie)

driver.get('https://education.beijing2022.cn/courseDetail?id=a87dfd70-4b65-11ec-a1af-7cd30ae46f00&type=requiredCourse')

# WebDriverWait(driver, 10).until(lambda d: d.find_element_by_xpath('//*[@id="app"]/div/div[1]/div[2]/section[1]/article/div/div/ul/li[3]')).click()

# WebDriverWait(driver, 10).until(lambda d: d.find_element_by_xpath('//*[@id="app"]/div/div[1]/div[2]/section[1]/article/ul/li[2]/div[1]/button')).click()

WebDriverWait(driver, 10).until(lambda d: d.find_element_by_xpath('//*[@id="app"]/div/div[2]/div[1]/div[2]/div')).click()

WebDriverWait(driver, 10).until(lambda d: d.find_element_by_xpath('//*[@id="app"]/div/div[3]/section/article/div[1]/div/div/div/div/p[3]/button')).click()

page_no = int(WebDriverWait(driver, 10).until(lambda d: d.find_element_by_xpath('//*[@id="iv-means-img"]/div[2]/span[3]')).text.strip('/'))

for page in range(page_no):
    page_img_src = WebDriverWait(driver, 10).until(lambda d: d.find_element_by_xpath('//*[@id="iv-means-img"]/div[1]/div/div[1]/img')).get_attribute("src")
    r = requests.get(page_img_src, verify=False)
    if r.ok:
        if len(r.content) > 0:
            with open("{}.png".format(page+1), "wb") as f:
                f.write(r.content)
            print(page+1)
        else:
            print("no data")
    else:
        print("not ok")
    driver.find_element_by_xpath('//*[@id="iv-means-img"]/div[4]').click()

driver.quit()