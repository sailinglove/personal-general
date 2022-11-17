from selenium.webdriver.support.ui import WebDriverWait
from msedge.selenium_tools import EdgeOptions
from msedge.selenium_tools import Edge
from selenium.common import exceptions as E
from urllib3.exceptions import MaxRetryError
import csv
from tqdm import trange

target_page = r'https://www.cfaa.cn/lxweb/queryCompanyProductInfo.action?researchFlag=1'
# payload = r'青岛越海昌国际贸易有限公司'

wd = r'Crawlers\Python\Norman\\'

with open(wd + 'FIC.txt', 'r', encoding='UTF-8') as fr:
    payloads = fr.readlines()
payloads = [x.strip() for x in payloads]

fw = open(wd + 'result.csv', 'w', encoding='UTF-8', newline='')
writer = csv.writer(fw)

# Headed
edge_options = EdgeOptions()
edge_options.use_chromium = True
driver = Edge(options=edge_options, executable_path="D:\Applications\edgedriver_win64\msedgedriver.exe")
# driver = webdriver.Edge()
# Headless
# edge_options = EdgeOptions()
# edge_options.use_chromium = True
# edge_options.add_argument('headless')
# driver = Edge(options=edge_options)
# driver.maximize_window()


for j in trange(len(payloads)):
# for payload in payloads:
    temp_row = [payloads[j]]
    # temp_row = [payload]

    try:
        driver.get(target_page)
        WebDriverWait(driver, 10).until(lambda d: d.find_element_by_xpath('//li[@onmousemove="setTab(1,1)"]'))
        driver.find_element_by_xpath('//li[@onmousemove="setTab(1,1)"]').click()
        driver.find_element_by_xpath('//input[@name="keyWordsa"]').send_keys(payloads[j])
        driver.find_element_by_xpath('//input[@value="搜 索企业"]').click()
    except E.TimeoutException:
        temp_row.append('page fault')
        print(temp_row)
        writer.writerow(temp_row)
    except KeyboardInterrupt:
        break
    except MaxRetryError:
        print('Internet issue, please retry later')
        break
    except:
        continue
    
    try:
        WebDriverWait(driver, 10).until(lambda d: d.find_element_by_xpath('//div[text()="公司简介"]'))
        temp_description = driver.find_element_by_xpath('//div[text()="公司简介"]/following::div[1]').text
        print(temp_description)
        temp_row.append(temp_description)

        tr_lst = driver.find_elements_by_xpath('//td[text()="英文名称"]/ancestor::tr/ancestor::tbody/tr')
        temp_product_lst = []
        for i in range(1,len(tr_lst)):
            td_lst = tr_lst[i].find_elements_by_xpath('.//td')
            for ele in td_lst:
                temp_product_lst.append(ele.text)
        print(temp_product_lst)
        temp_row.append('，'.join(temp_product_lst))
        print(temp_row)
        writer.writerow(temp_row)
    except E.TimeoutException:
        temp_row.append('company not found')
        print(temp_row)
        writer.writerow(temp_row)
    except KeyboardInterrupt:
        break
    except:
        continue

fw.close()
driver.close()
