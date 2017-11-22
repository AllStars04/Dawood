from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import _multiprocessing
import psutil
import Module.Report

from selenium.common.exceptions import TimeoutException
import Module.Utility
import datetime
import time
import Module.logger
import Module.CleanUp
import Module.Report
import os
import getpass
import Class.UserDefinedException


class SeleniumBrowser:
    def __init__(self):
        self.browserType = Module.Utility.ReadDataFromJsonFile("tool", "browserType")
        self.timeout = Module.Utility.ReadDataFromJsonFile("tool", "timeout")
        options = webdriver.ChromeOptions()
        options.add_argument(
            "user-data-dir=C:/users/" + getpass.getuser() + "/AppData/Local/Google/Chrome/User Data/Default")
        self.driver = webdriver.Chrome(chrome_options=options)
        self.get_input_type = Module.Utility.ReadDataFromJsonFile("tool", "configfile")
        self.dic = {}
        self.driver.maximize_window()
        # self.driver.save_screenshot("C:/Users/saurabh/Pictures")

    def __call__(self, *args, **kwargs):
        return self.driver

    def openUrl(self):
        # CHANGE get the URL from configuration file
        get_input_type = Module.Utility.ReadDataFromJsonFile("tool", "configfile")
        if get_input_type != "xls":
            url = Module.Utility.ReadDataFromLoginFile("sut", "url")
        elif get_input_type == "xls":
            Env = Module.Utility.fnReadDataFromExcel("Login.xlsx", "URL", "ToBeExecuted", "Yes", "Type")
            url = Module.Utility.fnReadDataFromExcel("Login.xlsx", "URL", "Type", Env, "URL")
        Module.logger.INFO("Opening URL " + url)
        self.driver.get(url)

    def login(self):

        get_input_type = Module.Utility.ReadDataFromLoginFile("tool", "configfile")
        if get_input_type != "xls":
            strUserName = Module.Utility.ReadDataFromLoginFile("Login", "Username")
            strPassword = Module.Utility.ReadDataFromLoginFile("Login", "Password")
        elif get_input_type == "xls":
            Env = Module.Utility.fnReadDataFromExcel("Login.xlsx", "URL", "ToBeExecuted", "Yes", "Type")
            strUserName = Module.Utility.fnReadDataFromExcel("Login.xlsx", Env, "TypeOfUser", "Admin", "UserName")
            strPassword = Module.Utility.fnReadDataFromExcel("Login.xlsx", Env, "TypeOfUser", "Admin", "Password")
        self.driver.find_element_by_id("__ns2087359418_username").send_keys(strUserName)
        self.driver.find_element_by_id("__ns2087359418_password").send_keys(strPassword)
        self.driver.find_element_by_id("__ns2087359418_loginBtn").click()
        home = None
        local_timeout = 0
        while (home == None) and local_timeout < self.timeout / 2:
            try:
                home = self.driver.find_element_by_id("__ns1790630358_homeLnk2")
            except:
                Module.logger.WARNING("Login not complete")
                time.sleep(2)
                local_timeout = local_timeout + 1

        if home:
            Module.logger.INFO("Logged in with user: Home screen is visible")
            time.sleep(1)
        else:
            Module.logger.ERROR("Login not completed within " + str(self.timeout) + " seconds")
            Module.Report.Failure(self, "Login not completed within " + str(self.timeout) + " seconds")
            Excep = Class.UserDefinedException.UserDefinedException()
            Excep.raiseException("Login not completed within " + str(self.timeout) + " seconds")

    def gotodefaultframe(self):
        Module.logger.DEBUG("Switching to default content")
        self.driver.switch_to.default_content()

    def gotocorrectframe(self):
        all_iframe = self.driver.find_elements_by_tag_name("IFRAME")
        framefound = "false"
        if all_iframe == None:
            Module.logger.DEBUG("There is no child frame available, so assuming current frame is the correct one")
        else:
            for frame in all_iframe:
                if frame.get_attribute("id") != "" and frame.get_attribute("id") != "home_iframe":
                    Module.logger.DEBUG("Switching to frame : " + frame.get_attribute("id"))
                    self.driver.switch_to.frame(frame.get_attribute("id"))
                    framefound = "true"
                if framefound == "true":
                    break

    def ifpageloaded(self):
        loaded = "true"
        ##CHANGE Code to check if page is loaded successfully or not
        count = 0
        self.driver.find_elements_by_class_name("loading")
        while loaded == "true" and count < self.timeout:
            try:
                elem = WebDriverWait(self.driver, 1).until(
                    EC.presence_of_element_located((By.CLASS_NAME, "preloader32"))
                )
            except:
                Module.logger.DEBUG("Exception in page loading")
                elem = None

            if elem != None and elem.is_displayed():
                Module.logger.DEBUG("Page is still loading, so waiting for page to load")
            else:
                Module.logger.DEBUG("Page loading is complete")
                loaded = "false"

            count = count + 1
            time.sleep(2)

    def getValueFromLabel(self, lblName, position=1):
        currentposition = 1
        found = "false"
        obj = self.driver.find_elements_by_tag_name("label")
        if obj != None:
            for lblObj in obj:
                if lblObj.text == lblName:
                    if currentposition == position:
                        span_obj = lblObj.find_elements_by_xpath("following::span")
                        Module.logger.INFO("The Value got from Label Name " + lblName + " is :" + str(span_obj[0].text))
                        found = "true"
                    else:
                        currentposition = currentposition + 1
                if found == "true":
                    return span_obj[0].text
        else:
            Module.logger.ERROR("No Object Found for the Label " + lblName)

    def logout(self):
        self.driver.find_element_by_id("__ns1790630358_logoutLnk").click()
        time.sleep(3)
    # def logout(self):
    #     print("logout starts")
    #     self.driver.find_element_by_id("__ns1790630358_logoutLnk").click()
    #     # time.sleep(10)
    #     self.driver.close()
        Module.CleanUp.killAllProcess()
        self.driver.close()
    #     # Module.Report.stopJVM()
    #     print("logout ends")

    def addValueToDic(self, valuetoStore, valueToAdd):
        Module.logger.ERROR("MEssagesent time is:" + valueToAdd)
        self.dic.update({valuetoStore: valueToAdd})

    def getValueFromDic(self, keytoget):
        value = self.dic.get(keytoget)
        if value != None:
            return value
        else:
            return keytoget

    def compareTwoValues(self, value1, value2, operation):
        gotvalue1 = self.dic.get(value1)
        if gotvalue1 == None:
            gotvalue1 = value1
        gotvalue2 = self.dic.get(value2)
        if gotvalue2 == None:
            gotvalue2 = value2

        if operation.lower() == "equal":
            if gotvalue1 == gotvalue2:
                Module.logger.INFO("Both Values Match!!. Values " + gotvalue1 + " and " + gotvalue2 + " are equal")
                Module.Report.Info(self,
                                   "Both Values Match!!. Values " + gotvalue1 + " and " + gotvalue2 + " are equal")
            else:
                Module.Report.Failure(self,
                                      "Values Dont Match!!. Values " + gotvalue1 + " and " + gotvalue2 + " are not equal")
                Module.logger.ERROR("Values Dont Match!!. Values " + gotvalue1 + " and " + gotvalue2 + " are not equal")
                Class.UserDefinedException.UserDefinedException().raiseException(
                    "Values Dont Match!!. Values " + gotvalue1 + " and " + gotvalue2 + " are not equal")

        elif operation.lower() == "not equal":
            if gotvalue1 != gotvalue2:
                Module.logger.INFO(
                    "Both Values Dont Match!!. Values " + gotvalue1 + " and " + gotvalue2 + " are not equal")
                Module.Report.Info(self,
                                   "Both Values Dont Match!!. Values " + gotvalue1 + " and " + gotvalue2 + " are not equal")
            else:
                Module.Report.Failure(self, "Values Match!!. Values " + gotvalue1 + " and " + gotvalue2 + " are equal")
                Module.logger.ERROR("Values Match!!. Values " + gotvalue1 + " and " + gotvalue2 + " are equal")
                Class.UserDefinedException.UserDefinedException().raiseException(
                    "Values Match!!. Values " + gotvalue1 + " and " + gotvalue2 + " are equal")

        elif operation.lower() == "less than":
            if gotvalue1 < gotvalue2:
                Module.logger.INFO("Value " + gotvalue1 + " is less than " + gotvalue2)
                Module.Report.Info(self, "Value " + gotvalue1 + " is less than " + gotvalue2)
            else:
                Module.Report.Failure(self, "Value " + gotvalue1 + " is not less than " + gotvalue2)
                Module.logger.ERROR("Value " + gotvalue1 + " is not less than " + gotvalue2)
                Class.UserDefinedException.UserDefinedException().raiseException(
                    "Value " + gotvalue1 + " is not less than " + gotvalue2)

        elif operation.lower() == "greater than":
            if gotvalue1 > gotvalue2:
                Module.logger.INFO("Value " + gotvalue1 + " is greater than " + gotvalue2)
                Module.Report.Info(self, "Value " + gotvalue1 + " is greater than " + gotvalue2)
            else:
                Module.Report.Failure(self, "Value " + gotvalue1 + " is not greater than " + gotvalue2)
                Module.logger.ERROR("Value " + gotvalue1 + " is not greater than " + gotvalue2)
                Class.UserDefinedException.UserDefinedException().raiseException(
                    "Value " + gotvalue1 + " is not greater than " + gotvalue2)

        elif operation.lower() == "greater than or equal":
            if gotvalue1 > gotvalue2 or gotvalue1 == gotvalue2:
                Module.logger.INFO("Value " + gotvalue1 + " is greater than or equal to " + gotvalue2)
                Module.Report.Info(self, "Value " + gotvalue1 + " is greater than or equal to " + gotvalue2)
            else:
                Module.Report.Failure(self, "Value " + gotvalue1 + " is not greater than or equal to " + gotvalue2)
                Module.logger.ERROR("Value " + gotvalue1 + " is not greater than or equal to " + gotvalue2)
                Class.UserDefinedException.UserDefinedException().raiseException(
                    "Value " + gotvalue1 + " is not greater than or equal to " + gotvalue2)

        else:
            Module.Report.Failure(self, "Operation type for comparision is not valid")
            Module.logger.ERROR("Operation type for comparision is not valid")
            Class.UserDefinedException.UserDefinedException().raiseException(
                "Operation type for comparision is not valid")
