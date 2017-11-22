import Class.Automation
# import Class.Automation
# import Module.Utility
#
# # idtype,idvalue = Module.Utility.CheckIfDefinedElementExistInRepo("text1","MSISDN")
# #
# # print(idtype)
# # print(idvalue)
#
# obj = Class.Automation.Automation()
# obj.openURL()
# obj.login()
# obj.clickOnMenu("Take a Call")
# obj.clickOnSubmeu("Customer")
# obj.enterText("MSISDN","40720011515")
# obj.clickOnButton("Search")
# obj.verifyTextOnScreen("Verify Customer")
# obj.selectDropDownOption("ID Number(10)","National ID")
# obj.clickOnButton("Pass")
# obj.clickOnButton("Verify")
# obj.verifyTextOnScreen("Customer Info")

def test2():
    obj = Class.Automation.Automation()
    obj.openURL()
    obj.login()
    obj.clickOnLink("PPVGE as Operator Administrator")
    obj.clickOnLink("Platform as Platform Support & IITC")
    obj.verifyTextOnScreen("Platform as Platform Support & IITC")
    print("Operator Role is Changed")
    obj.logout()
    obj.openURL()
    obj.login()
    obj.verifyTextOnScreen("PPVGE as Operator Administrator")
    print("SUCCESS : Operator is still logged in with Primary Login Role")
    obj.logout()

test2()

