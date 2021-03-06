from selenium import webdriver
from datetime import datetime
import time
from selenium.webdriver.common.keys import Keys


class TestHumidity():

    def PresentHumidityTest(self):

        # Setting up the chrome driver path
        driver = webdriver.Chrome(
        executable_path=r'C:/Users/KhanM51/Documents/chromedriver.exe')
        #Opening the web url
        driver.get("https://www.metoffice.gov.uk")
        # Maximizing Windows
        driver.maximize_window()
        # wait for second
        self.timewait(driver)
        #finding current time of the system
        now = datetime.now()
        cuttenttime = now.strftime("%H")
        print("Current time is  : ", cuttenttime)
        #calling method for validating the Edit cookies preferences
        temp = self.text(driver)
        if temp.text == "The Met Office values your privacy":
            #Need to click Ok Button
            driver.find_element_by_xpath("//button[contains(text(),'OK')]").click()
        else:
            print("Its Already checked the cookies prefences")
        self.timewait(driver)
        time.sleep(10)

        #Finding the search box and Entering palce name
        webelement = driver.find_element_by_xpath("//input[@role='combobox']").send_keys("Reading")
        time.sleep(10)
        driver.find_element_by_xpath("//input[@role='combobox']").send_keys(Keys.ENTER)
        time.sleep(10)

        #scroll down page till the element is visible
        driver.execute_script("window.scrollBy(0,300)","")
        time.sleep(10)

        #capturing Time from webgui
        data = []
        for tr in driver.find_elements_by_xpath("//table[@class='first-day']//tr[@class='step-time']"):
            tme = tr.find_elements_by_tag_name('th')
            if tme:
                data.append([th.text for th in tme])
        for i in tme:
            print("Time Captured is  : ", i.text)

        #Clicking on More details
        driver.find_element_by_xpath("//span[text()='More detail']").click()

        #Scrolling down the page
        driver.execute_script("window.scrollBy(0,500)", "")

        #List out all the time in a List
        data = []
        for tr in driver.find_elements_by_xpath("//table[@class='first-day']//tr[@class='detailed-view step-humidity']"):
            tds = tr.find_elements_by_tag_name('td')
            if tds:
                data.append([td.text for td in tds])

        for i in tds:
            print("Humidity captured is :", i.text)
        time.sleep(10)



 # Methods for Implicit wait

    def timewait(self, driver):
            """
            To wait for a limited time sec
            :param driver:
            :return:
            """
            driver.implicitly_wait(20)
    def text(self, driver):
        element = driver.find_element_by_id("oil-intro-heading")
        return element


cc = TestHumidity()
cc.PresentHumidityTest()
