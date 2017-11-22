from selenium.common.exceptions import NoSuchElementException
import Module.logger
import Module.Report
import Module.Utility
import Class.MobileNative
import MobileCommands.clickOnMobileIcon
import MobileCommands.enterTextToMobileField
import MobileCommands.enterTextOnMobile
import MobileCommands.clickOnMobileLink
import MobileCommands.selectMobRadioButton
import MobileCommands.clickOnMobileButton
import MobileCommands.clickOnMobileOption
import MobileCommands.tapMobileRadioOption
import MobileCommands.clickOnMobileIcon
import MobileCommands.verifyTextOnMobileScreen
import MobileCommands.verifySMSOnHandset
import MobileCommands.sendSMS
import MobileCommands.callNo
import MobileCommands.answerCall
import MobileCommands.endCall
import Class.UserDefinedException
from appium import webdriver
import sys
import subprocess
from subprocess import Popen,PIPE
import os
import time
Excep = Class.UserDefinedException.UserDefinedException()
class MobileAutomation:
    def __init__(self):
        self.mobiledriver = Class.MobileNative.MobileNative()
        self.mobiledriver()

    def selectDevice(self,device):
        Module.logger.INFO("Selecting mobile device" + device)
        self.mobiledriver.selectDevice(device)

    def launchApp(self,appName):
        Module.logger.INFO("Launching application "+ appName)
        self.mobiledriver.launchApp(appName)
        Module.Report.Success(self.mobiledriver,"Application "+ appName+" launched successfully")


    def clickOnMobileIcon(self, iconName):
        Module.logger.INFO("Clicking on icon: " + iconName)
        self.iconName = iconName
        MobileCommands.clickOnMobileIcon.clickOnMobileIcon(self.mobiledriver, iconName)
        Module.Report.Success(self.mobiledriver, "Icon " + iconName + " is clicked")

    def enterTextToMobileField(self,textFieldName,textValue):
        Module.logger.INFO("Sending text " + textValue + " for " + textFieldName)
        self.textFieldName = textFieldName
        self.textValue = textValue
        self.mobiledriver.tapEnterKey()
        MobileCommands.enterTextToMobileField.entertTextToMobileField(self.mobiledriver, textFieldName, textValue)
        Module.Report.Success(self.mobiledriver, "Text "+textValue+" entered to the field" + textFieldName)
        self.mobiledriver.tapEnterKey()


    def clickOnMobileLink(self, linkText):
        Module.logger.INFO("Clicking on link: " + linkText)
        self.linkText = linkText
        MobileCommands.clickOnMobileLink.clickOnMobileLink(self.mobiledriver, linkText)
        Module.Report.Success(self.mobiledriver, "Link " + linkText + " is clicked")

    def selectMobRadioButton(self,radiobuttonName):
        Module.logger.INFO("Selecting APN: " + radiobuttonName)
        self.apnName = radiobuttonName
        MobileCommands.selectMobRadioButton.selectMobRadioButton(self.mobiledriver, radiobuttonName)
        Module.Report.Success(self.mobiledriver,"Radiobutton "+radiobuttonName+" selected")

    def enterTextOnMobile(self,textValue):
        Module.logger.INFO("Sending text " + textValue + " to text field")
        self.textValue = textValue
        MobileCommands.enterTextOnMobile.enterTextOnMobile(self.mobiledriver, textValue)
        Module.Report.Success(self.mobiledriver, "Text " + textValue + "is entered")

    def tapEnterKey(self):
        Module.logger.INFO("Tapping enter key on mobile")
        self.mobiledriver.tapEnterKey()
        Module.Report.Success(self.mobiledriver, "Enter key tapped on mobile keyboard")

    def clickOnMobileButton(self,buttonName):
        Module.logger.INFO("Clicking on button: "+buttonName)
        self.buttonName = buttonName
        MobileCommands.clickOnMobileButton.clickOnMobileButton(self.mobiledriver, buttonName)
        Module.Report.Success(self.mobiledriver, "Button " + buttonName + "is clicked")

    def tapMobileRadioOption(self, optionName):
        Module.logger.INFO("Tapping on option: " + optionName)
        self.optionName = optionName
        MobileCommands.tapMobileRadioOption.tapMobileRadioOption(self.mobiledriver, optionName)
        Module.Report.Success(self.mobiledriver, "Option " + optionName + "is tapped")

    def tapHardRightKey(self):
        Module.logger.INFO("Tapping hard right key on mobile")
        self.mobiledriver.tapHardRightKey()
        Module.Report.Success(self.mobiledriver, "Tapped on hard right key on mobile")

    def swipeUp(self):
        Module.logger.INFO("Swiping up on mobile")
        self.mobiledriver.swipeUp()
        Module.Report.Success(self.mobiledriver, "Swiped up on mobile")

    def switchONMobileData(self):
        Module.logger.INFO("Switching on mobile data")
        self.mobiledriver.switchONMobileData()
        Module.Report.Success(self.mobiledriver, "Mobile data Switched ON")

    def switchOFFMobileData(self):
        Module.logger.INFO("Switching off mobile data")
        self.mobiledriver.switchOFFMobileData()
        Module.Report.Success(self.mobiledriver, "Mobile data Switched OFF")

    def clickOnMobileOption(self, optionName):
        Module.logger.INFO("Clicking on option: " + optionName)
        self.optionName = optionName
        MobileCommands.clickOnMobileOption.clickOnMobileOption(self.mobiledriver, optionName)
        Module.logger.INFO("Clicked" + optionName)
        Module.Report.Success(self.mobiledriver,"Clicked" +optionName)


    def clickOnHome(self):
        Module.logger.INFO("Clicking on Home button")
        self.mobiledriver.clickOnHomeButton()

    def verifyTextOnMobileScreen(self, textName):
        success = 0
        Module.logger.INFO("Verifying if text: " + textName + " is present on page")
        self.textName = textName
        textName = Module.Utility.readTestData(textName)
        counter = 1
        success = 0
        Module.Report.Info(self.mobiledriver, "Verifying that text: " + textName + " is present on mobile screen")
        while ((success == 0) and (counter < 5)):
            try:
                success = MobileCommands.verifyTextOnMobileScreen.verifyTextOnMobileScreen(self.mobiledriver, textName)

            except:
                time.sleep(5)
                counter = counter + 1

        if (success == 1):
            Module.logger.INFO("Text found : " + textName)
            Module.Report.Success(self.mobiledriver, "Text " + textName + " found on screen ")

        else:
            Module.Report.Failure(self.mobiledriver, "Text Not found : " + textName + " not available ")
            Module.logger.ERROR("Text Not found : " + textName)
            Excep.raiseException("Text Not found : " + textName)

    def verifyTextNotOnMobileScreen(self, textName):
        success = 0
        Module.logger.INFO("Verifying if text: " + textName + " is not present on page")
        self.textName = textName
        textName = Module.Utility.readTestData(textName)
        counter = 1
        Module.Report.Info(self.mobiledriver, "Verifying that text: " + textName + " is not present on mobile screen")
        while ((success == 0) and (counter < 5)):
            try:
                success = MobileCommands.verifyTextOnMobileScreen.verifyTextOnMobileScreen(self.mobiledriver, textName)

            except:
                time.sleep(5)
                counter = counter + 1

        if (success == 0):
            Module.logger.INFO("Text Not found : " + textName)
            Module.Report.Success(self.mobiledriver, "Text " + textName + " not found on screen ")

        else:
            Module.Report.Failure(self.mobiledriver, "Text is found : " + textName)
            Module.logger.ERROR("Text is found : " + textName)
            Excep.raiseException("Text is found : " + textName)

    def verifySMSOnHandset(self,smsTextToVerify,deviceName):
        Module.logger.INFO("Executing Commands to Verify SMS")
        self.deviceName = deviceName
        self.smsTextToVerify = smsTextToVerify
        Module.Report.Info(self.mobiledriver, "Executing Commands to Verify SMS")
        deviceName = Module.Utility.readTestData(deviceName)
        smsTextToVerify = Module.Utility.readTestData(smsTextToVerify)
        MobileCommands.verifySMSOnHandset.verifySMSOnHandset(self.mobiledriver,deviceName,smsTextToVerify)
        Module.Report.Success(self.mobiledriver, "SUCCESS : SMS Verification is successfull. Received SMS for "+smsTextToVerify)

    def sendSMS(self, deviceId,receiverNo, msgBody):
        Module.logger.INFO("Sending SMS to"+receiverNo)
        self.deviceId = deviceId
        deviceId = Module.Utility.readTestData(deviceId)
        receiverNo=Module.Utility.readTestData(receiverNo)
        msgBody=Module.Utility.readTestData(msgBody)
        MobileCommands.sendSMS.sendSMS(self.mobiledriver, deviceId,receiverNo, msgBody)
        Module.Report.Success(self.mobiledriver,"SMS send successfully to" + receiverNo)

    def switchONAirplaneMode(self):
        Module.logger.INFO("Switching on airplane mode")
        self.mobiledriver.switchONAirplaneMode()
        Module.Report.Success(self.mobiledriver, "Airplane mode Switched ON")

    def switchOFFAirplaneMode(self):
        Module.logger.INFO("Switching off airplane mode")
        self.mobiledriver.switchOFFAirplaneMode()
        Module.Report.Success(self.mobiledriver, "Airplane mode Switched OFF")

    def callNo(self, deviceId, receiverNo):
        Module.logger.INFO("Calling the no" + receiverNo)
        self.deviceId = deviceId
        deviceId = Module.Utility.readTestData(deviceId)
        receiverNo = Module.Utility.readTestData(receiverNo)
        MobileCommands.callNo.callNo(self.mobiledriver, deviceId, receiverNo)
        Module.Report.Success(self.mobiledriver, "Called the no" + receiverNo+ "successfully")

    def answerCall(self, deviceId):
        Module.logger.INFO("Answering call from" + deviceId)
        self.deviceId = deviceId
        deviceId = Module.Utility.readTestData(deviceId)
        MobileCommands.answerCall.answerCall(self.mobiledriver, deviceId)
        Module.Report.Success(self.mobiledriver, "Call answered from "+deviceId)

    def endCall(self, deviceId):
        Module.logger.INFO("Ending call from" + deviceId)
        self.deviceId = deviceId
        deviceId = Module.Utility.readTestData(deviceId)
        MobileCommands.endCall.endCall(self.mobiledriver, deviceId)
        Module.Report.Success(self.mobiledriver, "Call ended from "+deviceId)




