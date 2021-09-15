from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from msedge.selenium_tools import EdgeOptions
from msedge.selenium_tools import Edge
import requests

# Headed
edge_options = EdgeOptions()
edge_options.use_chromium = True
driver = Edge(options=edge_options)
# driver = webdriver.Edge()
# Headless
# edge_options = EdgeOptions()
# edge_options.use_chromium = True
# edge_options.add_argument('headless')
# driver = Edge(options=edge_options)

base_url = r"http://162.105.138.126/Usp/"
username = r"2000012804"
password = r"Iq8v6gpX0Yw1itd9"
bookname = "中华人民共和国对外关系史概论"
# bookxpath = r'//*[@id="right2"]/div[9]/dl/dd[1]/a'

driver.set_window_size(2736, 1824)

driver.get(base_url)

username_box = WebDriverWait(driver, 10).until(lambda d: d.find_element_by_id("user_name"))
password_box = driver.find_element_by_id("password")
username_box.send_keys(username)
password_box.send_keys(password)

driver.find_element_by_id("logon_button").click()

searchbox = WebDriverWait(driver, 10).until(lambda d: d.find_element_by_id("tbKeywords"))
searchbox.send_keys(bookname)
search_btn = driver.find_element_by_id("uspSearch")
search_btn.click()

bookpage = WebDriverWait(driver, 10).until(lambda d: d.find_element_by_xpath('//*[@id="right2"]/div[9]/dl/dd[1]/a'))
bookpage.click()

driver.switch_to.window(driver.window_handles[1])

read_btn = WebDriverWait(driver, 10).until(lambda d: d.find_element_by_xpath('//*[@id="onlineread"]/span/a'))
read_btn.click()

driver.switch_to.window(driver.window_handles[2])

pages = int(WebDriverWait(driver, 10).until(lambda d: d.find_element_by_id("TotalCount").text))

for page in range(pages):
    page_img_src = WebDriverWait(driver, 10).until(lambda d: d.find_element_by_id("img{}".format(str(page+1)))).get_attribute("src")
    print(page_img_src)
    r = requests.get(page_img_src)
    # http://162.105.138.126/OnLineReader/command/imagepage.ashx?objID=obj201311277qul6pld3rihackc0000054767&metaId=u.meta20131101utk07qul6pld0000056185&OrgId=apabi_usp&Ip=undefined&scale=4.182993668076062&width=2562&height=3537&pageid=1&ServiceType=Imagepage&scaleType=1&OrWidth=612.480009126663&OrHeight=845.760012602806&testres=&debug=&SessionId=4B90CECAC476BD93&UserName=%E5%90%91%E4%B8%80%E5%B8%86&cult=CN&rights=1-0_00&time=2021-09-15%2013:17:35&sign=A3030547FBC9D0F2A7E4CBA206094920
    if r.ok:
        if len(r.content) > 0:
            with open("{}.png".format(page+1), "wb") as f:
                f.write(r.content)
            print(page+1)
        else:
            print("no data")
    else:
        print("not ok")
    driver.find_element_by_id("rightSide").click()

driver.quit()