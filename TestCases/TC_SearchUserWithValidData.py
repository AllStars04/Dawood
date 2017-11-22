import Class.Automation

obj = Class.Automation.Automation()
obj.openURL()
obj.login()
obj.clickOnLink("Administration")
obj.clickOnLink("Users")
obj.verifyTextOnScreen("Users")
obj.enterText("Username","Aaron Jarvis")
obj.clickOnButton("Search")
obj.verifyTextOnScreen("matching result")
print("SUCCESS : Operator is able to search user with valid data")
obj.logout()