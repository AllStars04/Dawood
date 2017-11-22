from behave import *
import Class.MobileAutomation
import Module.Utility
import Module.logger
import Module.Report
import string

#Module.CleanUp.killAllProcess()
mobiledriver= Class.MobileAutomation.MobileAutomation()

@Given('select mobile "{device}"')
def selectDevice(self,device):
    mobiledriver.selectDevice(device)

@When('launch mobile app "{appName}"')
def launchMobileApp(self,appName):
    mobiledriver.launchApp(appName)

@Then('click on mobile icon "{iconname}"')
def clickonMobileIcon(self, iconname):
    mobiledriver.clickOnMobileIcon(iconname)

@Then('enter "{textFieldName}" "{textValue}" on mobile')
def enterTextToMobileField(self,textFieldName,textValue):
    mobiledriver.enterTextToMobileField(textFieldName,textValue)

@When('click on mobile link "{linkName}"')
def clickOnMobileLink(self,linkName):
    mobiledriver.clickOnMobileLink(linkName)

@Then ('select mobile radiobutton "{radbtnName}"')
def selectMobRadioButton(self,radbtnName):
    mobiledriver.selectMobRadioButton(radbtnName)

@Then('enter "{textValue}" on mobile')
def enterTextOnMobile(self,textValue):
    mobiledriver.enterTextOnMobile(textValue)

@Then('tap on enter key on mobile')
def tapEnterKey(self):
    mobiledriver.tapEnterKey()

@Then('tap on hard right key on mobile')
def tapHardRightKey(self):
    mobiledriver.tapHardRightKey()

@Then('click on text option "{optionname}" on mobile')
def clickonMobileOption(self, optionname):
    mobiledriver.clickOnMobileOption(optionname)

@Then('swipe up')
def swipeUp(self):
    mobiledriver.swipeUp()

@Then('tap mobile radio option "{optionname}"')
def tapMobileRadioOption(self, optionname):
    mobiledriver.tapMobileRadioOption(optionname)

@Then('click on mobile button "{btnname}"')
def clickonMobileButton(self, btnname):
    mobiledriver.clickOnMobileButton(btnname)

@Then('switch on mobile data')
def switchOnMobileData(self):
    mobiledriver.switchONMobileData()


@Then('switch off mobile data')
def switchOffMobileData(self):
    mobiledriver.switchOFFMobileData()


@Then('verify text "{textname}" on mobile')
def verifytext(self,textname):
    mobiledriver.verifyTextOnMobileScreen(textname)

@Then('verify no text "{textname}" on mobile')
def verifytext(self,textname):
    mobiledriver.verifyTextNotOnMobileScreen(textname)

@Then('click on home button')
def clickOnHomeButton(self):
    mobiledriver.clickOnHome()

@Then('verify if SMS "{smsTextToVerify}" on "{deviceName}"')
def verifySMSOnHandset(self,smsTextToVerify,deviceName):
    mobiledriver.verifySMSOnHandset(smsTextToVerify,deviceName)

@Then('send sms "{msgBody}" from "{deviceId}" to "{receiverNo}"')
def sendSMS(self,deviceId,receiverNo,msgBody):
    mobiledriver.sendSMS(deviceId,receiverNo,msgBody)

@Then('switch on airplane mode')
def switchOnAirplaneMode(self):
    mobiledriver.switchONAirplaneMode()

@Then('switch off airplane mode')
def switchOffAirplaneMode(self):
    mobiledriver.switchOFFAirplaneMode()

@Then('from "{deviceId}" call No "{receiverNo}"')
def callNo(self, deviceId, receiverNo):
    mobiledriver.callNo(deviceId, receiverNo)


