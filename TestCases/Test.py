# import Module.Utility
# import Module.ClickOnButton
# import Module.clickOnMenuAndSubmenu
# import Module.enterText
# import Class.SeleniumDriver
# import Module.verifyTextOnScreen
# import Module.selectDropDownOption
#
#
# Class.SeleniumDriver.getWebDriver()
# Class.SeleniumDriver.openUrl()
# Class.SeleniumDriver.login()
# Class.SeleniumDriver.gotodefaultframe()
# Module.clickOnMenuAndSubmenu.clickOnMenuAndSubmenu("Take a Call","Customer")
# Class.SeleniumDriver.gotocorrectframe()
# Module.enterText.enterText("MSISDN","40720011515")
# Module.ClickOnButton.clickOnButton("Search")
# Module.verifyTextOnScreen.verifyTextOnScreen("Verify Customer")
# Module.selectDropDownOption.selectDropDownOption("ID Number(10)","National ID")
# Module.selectDropDownOption.selectDropDownOption("Currency","USD")
# Module.ClickOnButton.clickOnButton("Pass")
# Module.ClickOnButton.clickOnButton("Verify")
# Module.ClickOnButton.clickOnButton("Customer Info")
#
#
# print(Module.Utility.ReadDataFromJsonFile("tool","browserType"))
# print(Module.Utility.ReadDataFromJsonFile("sut","url"))
#
#import pytest
import Class.Automation
import time
import Module.Utility

# idtype,idvalue = Module.Utility.CheckIfDefinedElementExistInRepo("text1","MSISDN")
#
# print(idtype)
# print(idvalue)
# def test():
#     obj = Class.Automation.Automation()
#     obj.openURL()
#     obj.login()
#     obj.clickOnLink("PPVGE as Operator Administrator")
#     obj.clickOnLink("Platform as Platform Support & IITC")
#     obj.clickOnLink("Tools")
#     obj.clickOnLink("All tasks")
#     obj.verifyTextOnScreen("Tasks")
#     obj.clickOnButton("Create task")
#     obj.verifyTextOnScreen("Task detail")
#     obj.enterTextArea("Description", "Test Task")
#     obj.clickOnButton("Create")
#     obj.verifyTextOnScreen("The task was successfully created!")
#     obj.clickOnLink("See task detail")
#     obj.verifyTextOnScreen("Details")
#     obj.logout()
#     print("Success")
#
#
#
# test()


