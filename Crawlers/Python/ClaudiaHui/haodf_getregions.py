from selenium import webdriver
from selenium.common import exceptions as E
import csv
# import json

relative_path = "Crawlers\\Python\\ClaudiaHui"
name = "haodf_region_result"

result = {}

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


# per province
for province in province_links.keys():
    temp_province = {}
    temp_province['link'] = province_links[province]
    cities = {}
    driver.get(province_links[province])
    # get cities
    for city in driver.find_elements_by_xpath("//div[@class='m_title_green']"):
        temp_city = {}
        hospitals = {}
        hospital_link = {}
        city_name = city.text
        # get hospitals
        for hospital in driver.find_elements_by_xpath("//*[@id='" + city_name + "']//following-sibling::div[1]/ul/li/a"):
            hospital_link[hospital.text] = hospital.get_attribute("href")
        print(hospital_link)
        for hospital in hospital_link.keys():
            temp_hospital = {}
            faculties = {}
            temp_hospital["link"] = hospital_link[hospital]
            driver.get(hospital_link[hospital])
            # get faculties
            for faculty in driver.find_elements_by_xpath("//*[@class='f-l-i-name']"):
                temp_faculty = {}
                departments = {}
                department_links = {}
                faculty_name = faculty.text
                print(faculty_name)
                # get departments
                for department in driver.find_elements_by_xpath("//*[div='" + faculty_name + "']//div/a"):
                    department_links[department.text] = department.get_attribute("href")
                print(department_links)
                for department in department_links.keys():
                    temp_department = {}
                    temp_department["link"] = department_links[department]
                    temp_html = department_links[department][:-4]
                    driver.get(department_links[department])
                    pages = int(driver.find_element_by_xpath("//div[@class='p_bar']/a[contains(text(), '共')]").text[2:-2])
                    doctor_links = {}
                    # visit every page of the department
                    for i in range(pages):
                        driver.get(temp_html + "/menzhen_" + str(i+1) + ".htm")
                        for doctor in driver.find_elements_by_xpath("//a[@class='name']"):
                            doctor_links[doctor.text] = doctor.get_attribute("href")
                    print(doctor_links, len(doctor_links))
                    # get doctor's info
                    doctors = {}
                    for doctor in doctor_links.keys():
                        driver.get(doctor_links[doctor])
                        temp_doctor = {}
                        try:
                            temp_doctor["职称"] = driver.find_element_by_xpath("//*[@class='doctor-title']").text
                        except E.NoSuchElementException:
                            temp_doctor["职称"] = None
                        try:
                            temp_doctor["教育职称"] = driver.find_element_by_xpath("//*[@class='doctor-educate-title']").text
                        except E.NoSuchElementException:
                            temp_doctor["教育职称"] = None
                        try:
                            temp_doctor["综合推荐热度"] = driver.find_element_by_xpath("//span[@class='value']").text
                        except E.NoSuchElementException:
                            temp_doctor["综合推荐热度"] = None
                        try:
                            temp_doctor["在线问诊量"] = driver.find_element_by_xpath("//span[@class='value js-consult-count']").text
                        except E.NoSuchElementException or ValueError:
                            temp_doctor["在线问诊量"] = None
                        try:
                            temp_doctor["擅长"] = driver.find_element_by_xpath("//div[@class='content-wrap expertise-content-wrap']/p").text
                        except E.NoSuchElementException:
                            temp_doctor["擅长"] = None
                        try:
                            temp_doctor["个人网站总访问"] = driver.find_element_by_xpath("//span[@class='per-sta-data js-total-new-pv']").text
                        except E.NoSuchElementException:
                            temp_doctor["个人网站总访问"] = None
                        try:
                            temp_doctor["个人网站总文章"] = driver.find_element_by_xpath("//span[@class='per-sta-data js-articleCount']").text
                        except E.NoSuchElementException:
                            temp_doctor["个人网站总文章"] = None
                        try:
                            temp_doctor["个人网站总患者"] = driver.find_element_by_xpath("//span[@class='per-sta-data js-spaceRepliedCount']").text
                        except E.NoSuchElementException:
                            temp_doctor["个人网站总患者"] = None
                        try:
                            temp_doctor["微信诊后报道患者"] = driver.find_element_by_xpath("//span[@class='per-sta-data js-wxdiagnosis-report']").text
                        except E.NoSuchElementException:
                            temp_doctor["微信诊后报道患者"] = None
                        try:
                            temp_doctor["总诊后报到患者"] = driver.find_element_by_xpath("//span[@class='per-sta-data js-totaldiagnosis-report']").text
                        except E.NoSuchElementException:
                            temp_doctor["总诊后报到患者"] = None
                        try:
                            temp_doctor["诊后服务星"] = len(driver.find_elements_by_xpath("//img[@alt='金色星星']"))
                        except E.NoSuchElementException:
                            temp_doctor["诊后服务星"] = None
                        try:
                            temp_doctor["诊治后患者数"] = driver.find_element_by_xpath("//span[contains(text(), '诊治后的患者数')]/following-sibling::span").text
                        except E.NoSuchElementException:
                            temp_doctor["诊治后患者数"] = None
                        try:
                            temp_doctor["随访中患者数"] = driver.find_element_by_xpath("//span[contains(text(), '随访中的患者数')]/following-sibling::span").text
                        except E.NoSuchElementException:
                            temp_doctor["随访中患者数"] = None
                        doctors[doctor] = temp_doctor
                        print(temp_doctor)
                    temp_department["doctors"] = doctors
                    departments[department] = temp_department
                faculties[faculty] = departments
            temp_hospital["faculties"] = faculties
            hospitals[hospital] = temp_hospital
        cities[city] = hospitals
    temp_province["cities"] = cities
    result[province] = temp_province

print(result)

with open(relative_path + "haodf_result.csv", "wt") as f:
    cw = csv.writer(f)
    cw.writerow("省/直辖市", "市/区", "医院", "科室类别", "科室", "姓名", "职称", "教育职称", "综合推荐热度", "在线问诊量", "擅长", \
                "个人网站总访问", "个人网站总文章", "个人网站总患者", "微信诊后报道患者", "总诊后报到患者", "诊后服务星", "诊治后患者数", "随访中患者数")
    for province in result.keys():
        for city in result[province]['cities'].keys():
            for hospital in result[province]['cities'][city].keys():
                for faculty in result[province]['cities'][city][hospital]["faculties"].keys():
                    for department in result[province]['cities'][city][hospital]["faculties"][faculty].keys():
                        for doctor in result[province]['cities'][city][hospital]["faculties"][faculty]["doctors"].keys():
                            doctor_data = result[province]['cities'][city][hospital]["faculties"][faculty]["doctors"]
                            cw.writerow(province, city, hospital, faculty, department, doctor, doctor_data["职称"], doctor_data["教育职称"], doctor_data["综合推荐热度"], \
                                        doctor_data["在线问诊量"], doctor_data["擅长"], doctor_data["个人网站总访问"], doctor_data["个人网站总文章"], doctor_data["个人网站总患者"], \
                                        doctor_data["微信诊后报道患者"], doctor_data["总诊后报到患者"], doctor_data["诊后服务星"], doctor_data["诊治后患者数"], doctor_data["随访中患者数"])


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