from selenium import webdriver
from selenium.common import exceptions as E
import csv
from os import path
# import json

relative_path = "Crawlers\\Python\\ClaudiaHui\\results\\"
name = "haodf_result-"

result = {}

# Head
driver = webdriver.PhantomJS()
# driver.set_page_load_timeout(10)


# get province
province_links = {}
driver.get("https://www.haodf.com/yiyuan/beijing/list.htm")

window_province = driver.window_handles[0]
driver.execute_script("window.open('')")
window_hospital = driver.window_handles[1]
driver.execute_script("window.open('')")
window_department = driver.window_handles[2]
driver.switch_to_window(window_province)

for province in driver.find_elements_by_xpath("//*[@id='el_tree_1000000']/div/a"):
    province_links[province.text] = province.get_attribute("href")
print(province_links)

# per province
for province in province_links.keys():
    driver.switch_to_window(window_province)
    driver.get(province_links[province])
    # get cities
    for city in driver.find_elements_by_xpath("//div[@class='m_title_green']"):
        if city.text in ["朝阳", "海淀", "西城"]:
            continue
        driver.switch_to_window(window_province)
        hospital_link = {}
        city_name = city.text
        file_name = relative_path + name + "{}_{}.csv".format(province, city_name)
        with open(file_name, "a", encoding="utf-8-sig") as f_c:
            cw_c = csv.writer(f_c, dialect="excel", lineterminator="\n")
            if path.getsize(file_name) == 0:
                cw_c.writerow(["姓名", "省/直辖市", "市/区", "医院", "科室类别", "科室", "职称", "教育职称", "综合推荐热度", "在线问诊量", "擅长", \
                            "个人网站总访问", "个人网站总文章", "个人网站总患者", "微信诊后报道患者", "总诊后报到患者", "诊后服务星", "诊治后患者数", "随访中患者数"])
            # get hospitals
            for hospital in driver.find_elements_by_xpath("//*[@id='" + city_name + "']//following-sibling::div[1]/ul/li/a"):
                hospital_link[hospital.text] = hospital.get_attribute("href")
            print(hospital_link)
            for hospital in hospital_link.keys():
                driver.switch_to_window(window_hospital)
                driver.get(hospital_link[hospital])
                # get faculties
                for faculty in driver.find_elements_by_xpath("//*[@class='f-l-i-name']"):
                    driver.switch_to_window(window_hospital)
                    department_links = {}
                    faculty_name = faculty.text
                    print(faculty_name)
                    # get departments
                    for department in driver.find_elements_by_xpath("//*[div='" + faculty_name + "']//div/a"):
                        department_links[department.text] = department.get_attribute("href")
                    print(department_links)
                    for department in department_links.keys():
                        temp_html = department_links[department][:-4]
                        driver.switch_to_window(window_department)
                        driver.get(department_links[department])
                        try:
                            pages = int(driver.find_element_by_xpath("//div[@class='p_bar']/a[contains(text(), '共')]").text[2:-2])
                        except:
                            pages = 1
                        doctor_links = {}
                        # visit every page of the department
                        for i in range(pages):
                            driver.get(temp_html + "/menzhen_" + str(i+1) + ".htm")
                            for doctor in driver.find_elements_by_xpath("//a[@class='name']"):
                                doctor_links[doctor.text] = doctor.get_attribute("href")
                        print(doctor_links, len(doctor_links))
                        # get doctor's info
                        for doctor in doctor_links.keys():
                            driver.get(doctor_links[doctor])
                            temp_doctor = {}
                            doctor_list = [doctor, province, city_name, hospital, faculty_name, department]
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//*[@class='doctor-title']").text)
                            except E.NoSuchElementException or E.TimeoutException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//*[@class='doctor-educate-title']").text)
                            except E.NoSuchElementException or E.TimeoutException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[@class='value']").text)
                            except E.NoSuchElementException or E.TimeoutException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[@class='value js-consult-count']").text)
                            except E.NoSuchElementException or E.TimeoutException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//div[@class='content-wrap expertise-content-wrap']/p").text)
                            except E.NoSuchElementException or E.TimeoutException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[@class='per-sta-data js-total-new-pv']").text)
                            except E.NoSuchElementException or E.TimeoutException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[@class='per-sta-data js-articleCount']").text)
                            except E.NoSuchElementException or E.TimeoutException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[@class='per-sta-data js-spaceRepliedCount']").text)
                            except E.NoSuchElementException or E.TimeoutException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[@class='per-sta-data js-wxdiagnosis-report']").text)
                            except E.NoSuchElementException or E.TimeoutException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[@class='per-sta-data js-totaldiagnosis-report']").text)
                            except E.NoSuchElementException or E.TimeoutException:
                                doctor_list.append('')
                            try:
                                stars = len(driver.find_elements_by_xpath("//img[@alt='金色星星']"))
                                if stars > 0:
                                    doctor_list.append(stars)
                                else:
                                    doctor_list.append('')
                            except E.NoSuchElementException or E.TimeoutException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[contains(text(), '诊治后的患者数')]/following-sibling::span").text)
                            except E.NoSuchElementException or E.TimeoutException:
                                doctor_list.append('')
                            try:
                                doctor_list.append(driver.find_element_by_xpath("//span[contains(text(), '随访中的患者数')]/following-sibling::span").text)
                            except E.NoSuchElementException or E.TimeoutException:
                                doctor_list.append('')
                            print(doctor_list)
                            cw_c.writerow(doctor_list)

print(result)


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