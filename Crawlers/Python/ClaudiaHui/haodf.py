from selenium import webdriver
from selenium.common import exceptions as E
import csv
# import json

relative_path = "Crawlers\\Python\\ClaudiaHui\\"
name = "haodf_region_result"

# Head
# driver = webdriver.Chrome()
# Headless
option = webdriver.ChromeOptions()
option.add_argument('headless')
driver = webdriver.Chrome(chrome_options=option)


# get province
province_links = {}
driver.get("https://www.haodf.com/yiyuan/beijing/list.htm")

for province in driver.find_elements_by_xpath("//*[@id='el_tree_1000000']/div/a"):
    province_links[province.text] = province.get_attribute("href")
print(province_links)

with open(relative_path + "haodf_result.csv", "wt", encoding="utf-8-sig") as f:
    cw = csv.writer(f)
    cw.writerow(["省/直辖市", "市/区", "医院", "科室类别", "科室", "姓名", "职称", "教育职称", "综合推荐热度", "在线问诊量", "擅长", \
                "个人网站总访问", "个人网站总文章", "个人网站总患者", "微信诊后报道患者", "总诊后报到患者", "诊后服务星", "诊治后患者数", "随访中患者数"])
# per province
    for province in province_links.keys():
        driver.get(province_links[province])
        # get cities
        for city in driver.find_elements_by_xpath("//div[@class='m_title_green']"):
            hospital_link = {}
            city_name = city.text
            # get hospitals
            for hospital in driver.find_elements_by_xpath("//*[@id='" + city_name + "']//following-sibling::div[1]/ul/li/a"):
                hospital_link[hospital.text] = hospital.get_attribute("href")
            print(hospital_link)
            for hospital in hospital_link.keys():
                driver.get(hospital_link[hospital])
                # get faculties
                for faculty in driver.find_elements_by_xpath("//*[@class='f-l-i-name']"):
                    department_links = {}
                    faculty_name = faculty.text
                    print(faculty_name)
                    # get departments
                    for department in driver.find_elements_by_xpath("//*[div='" + faculty_name + "']//div/a"):
                        department_links[department.text] = department.get_attribute("href")
                    print(department_links)
                    for department in department_links.keys():
                        temp_html = department_links[department][:-4]
                        driver.get(department_links[department])
                        pages = int(driver.find_element_by_xpath("//div[@class='p_bar']/a[contains(text(), '共')]").text[2:-2])
                        doctor_links = {}
                        for i in range(pages):
                            driver.get(temp_html + "/menzhen_" + str(i+1) + ".htm")
                            for doctor in driver.find_elements_by_xpath("//a[@class='name']"):
                                doctor_links[doctor.text] = doctor.get_attribute("href")
                        print(doctor_links, len(doctor_links))
                        # get doctor's info
                        for doctor in doctor_links.keys():
                            driver.get(doctor_links[doctor])
                            doctor_list = [province, city_name, hospital, faculty_name, department, doctor]
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//*[@class='doctor-title']").text)
                            except E.NoSuchElementException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//*[@class='doctor-educate-title']").text)
                            except E.NoSuchElementException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[@class='value']").text)
                            except E.NoSuchElementException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[@class='value js-consult-count']").text)
                            except E.NoSuchElementException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//div[@class='content-wrap expertise-content-wrap']/p").text)
                            except E.NoSuchElementException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[@class='per-sta-data js-total-new-pv']").text)
                            except E.NoSuchElementException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[@class='per-sta-data js-articleCount']").text)
                            except E.NoSuchElementException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[@class='per-sta-data js-spaceRepliedCount']").text)
                            except E.NoSuchElementException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[@class='per-sta-data js-wxdiagnosis-report']").text)
                            except E.NoSuchElementException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[@class='per-sta-data js-totaldiagnosis-report']").text)
                            except E.NoSuchElementException:
                                doctor_list.append('')
                            try:
                                stars = len(driver.find_elements_by_xpath("//img[@alt='金色星星']"))
                                if stars > 0:
                                    doctor_list.append(stars)
                                else:
                                    doctor_list.append('')
                            except E.NoSuchElementException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[contains(text(), '诊治后的患者数')]/following-sibling::span").text)
                            except E.NoSuchElementException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[contains(text(), '随访中的患者数')]/following-sibling::span").text)
                            except E.NoSuchElementException:
                                doctor_list.append('')
                            print(doctor_list)
                            cw.writerow(doctor_list)

driver.quit()

# {province_name : {
#   'link':province_link, 
#   'cities/dictricts' : {
#       city_name : {
#           hospital_name : {
#               'link': hosipital_link,
#               faculty_name : {
#                       department_name : {
#                           'link' : department_link,
#                           doctors : {
#                               doctor_name : {
#                                   '职称' : doctor_title,
#                                   '教育职称' : doctor_education_title,
#                                   '综合推荐热度' : heatness,
#                                   '在线问诊量' : qurries,
#                                   '擅长' : expertise,
#                                   '个人网站总访问' : site_visit,
#                                   '总文章' : articles,
#                                   '总患者' : patients,
#                                   '微信诊后报到患者' : wechat_patient_reports,
#                                   '总诊后报到患者' : total_patient_reports,
#                                   '诊后服务星' : stars,
#                                   '诊治后患者数' : completed_patients,
#                                   '随访中患者数' : followup_patients
#                               }
#                           }
#                       }
#                   }
#               }
#           }
#       }
#   }
# }