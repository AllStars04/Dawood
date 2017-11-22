from appium import webdriver
from appium.webdriver.common.touch_action import TouchAction
import Class.UserDefinedException
import Module.Utility
import Module.getMobileObject
import Module.logger
import Module.CleanUp
from time import sleep
import Module.Report
import getpass
Excep = Class.UserDefinedException.UserDefinedException()


class MobileNative:

    def __init__(self):
        self.mobiledriver=webdriver.Remote

    def __call__(self):
        return self.mobiledriver

    def selectDevice(self,device):
        try:
            self.device=device
            self.platformName = Module.Utility.ReadDataFromMobileConfig(self.device, "platformName")
            self.platformVersion = Module.Utility.ReadDataFromMobileConfig(self.device, "platformVersion")
            self.deviceName = Module.Utility.ReadDataFromMobileConfig(self.device, "deviceName")

            self.desired_caps = {}
            self.desired_caps['platformName'] = self.platformName
            self.desired_caps['platformVersion'] = self.platformVersion
            self.desired_caps['deviceName'] = self.deviceName
        except:
            Module.logger.ERROR("Mobile device not found")
            Module.Report.Failure(self.mobiledriver, "Mobile device not found")
            Excep.raiseException("Mobile device not found")




    def launchApp(self,appName):
        try:
            self.appName = appName
            self.appPackage= Module.Utility.ReadDataFromMobileConfig(self.appName, "appPackage")
            self.appActivity = Module.Utility.ReadDataFromMobileConfig(self.appName, "appActivity")
            self.desired_caps['appPackage'] = self.appPackage
            self.desired_caps['appActivity'] = self.appActivity
            self.desired_caps['autoAcceptAlerts'] = True
            self.desired_caps['autoGrantPermissions'] =True
            self.mobiledriver = webdriver.Remote('http://localhost:4723/wd/hub', self.desired_caps)
        except:
            Module.logger.ERROR("Application is not launched successfully")
            #Module.Report.Failure(self.mobiledriver, "Application is not launched successfully")
            Excep.raiseException("Application is not launched successfully")

    def tapEnterKey(self):
        try:
            self.mobiledriver.press_keycode(66, metastate=None)
            sleep(5)
        except:
            Module.logger.ERROR("Cannot tap enter key on mobile")
            Module.Report.Failure(self.mobiledriver, "Cannot tap enter key on mobile")
            Excep.raiseException("Cannot tap enter key on mobile")

    def clickOnHomeButton(self):
        try:
            self.mobiledriver.press_keycode(3, metastate=None)
            sleep(5)
        except:
            Module.logger.ERROR("Cannot click home on mobile")
            Module.Report.Failure(self.mobiledriver, "Cannot click home on mobile")
            Excep.raiseException("Cannot click home on mobile")

    def trial1(self):
        # return self.mobiledriver.find_element_by_xpath("//android.widget.TextView[@content-desc='Search']")
        # return self.mobiledriver.find_element_by_xpath("//android.widget.TextView[@text='Java Programming']")
        # list = find_mobile_auto_list_elements(self,locator,locatorvalue)
        list = self.mobiledriver.find_elements_by_xpath(".//android.widget.ListView//android.widget.LinearLayout")
        if list != None:
                for each in list:
                   cell = each.find_element_by_xpath("//android.widget.RelativeLayout//android.widget.TextView")
                   if cell.text == "O2 PREPAY":
                        try:
                            obj=each.find_element_by_xpath("//android.widget.RadioButton")
                            obj.click()
                            found = "true"
                            break
                        except:
                            Module.logger.ERROR("Radiobutton is not clickable")

                        if found == "true" :
                         Module.logger.ERROR("Clicked on Radiobutton")
                        else:
                          Module.logger.ERROR("No Radio button is available with the given text")


    def tapHardRightKey(self):
        try:
            self.mobiledriver.press_keycode(82, metastate=None)
            sleep(5)
        except:
            Module.logger.ERROR("Cannot tap hard right key on mobile")
            Module.Report.Failure(self.mobiledriver, "Cannot tap hard right key on mobile")
            Excep.raiseException("Cannot tap hard right key on mobile")

    def swipeUp(self):
        try:
            size = self.mobiledriver.get_window_size()
            starty = (int)(size["height"] * 0.80)
            endy = (int)(size["height"]  * 0.20)
            startx = size["width"]  / 2
            self.mobiledriver.swipe(startx, starty, startx, endy)
        except:
            Module.logger.ERROR("Cannot swipe up on mobile")
            Module.Report.Failure(self.mobiledriver, "Cannot swipe up on mobile")
            Excep.raiseException("Cannot swipe up on mobile")


    def switchONMobileData(self):
        try:
            self.mobiledriver.set_network_connection(4)
        except:
            Module.logger.ERROR("Cannot switch ON mobile data")
            Module.Report.Failure(self.mobiledriver, "Cannot switch ON mobile data")
            Excep.raiseException("Cannot switch ON mobile data")

    def switchOFFMobileData(self):
        try:
            self.mobiledriver.set_network_connection(0)
        except:
            Module.logger.ERROR("Cannot switch OFF mobile data")
            Module.Report.Failure(self.mobiledriver, "Cannot switch OFF mobile data")
            Excep.raiseException("Cannot switch OFF mobile data")

    def switchONAirplaneMode(self):
        try:
            self.mobiledriver.set_network_connection(1)
        except:
            Module.logger.ERROR("Cannot switch ON airplane mode")
            Module.Report.Failure(self.mobiledriver, "Cannot switch ON airplane mode")
            Excep.raiseException("Cannot switch ON airplane mode")

    def switchOFFAirplaneMode(self):
        try:
            self.mobiledriver.set_network_connection(0)
        except:
            Module.logger.ERROR("Cannot switch OFF airplane mode")
            Module.Report.Failure(self.mobiledriver, "Cannot switch OFF airplane mode")
            Excep.raiseException("Cannot switch OFF airplane mode")
