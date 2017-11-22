import re
import time
from datetime import datetime

import selenium
from dateutil.relativedelta import relativedelta

import Class.MobileNative
import Class.SeleniumBrowser
# import Module.Reports
import Commands.ClickOnButton
import Commands.clickOnExpandLink
import Commands.clickOnHeaderOfTable
import Commands.clickOnImage
import Commands.clickOnInifinity
import Commands.clickOnInput
import Commands.clickOnLink
import Commands.clickOnList
import Commands.clickOnMenu
import Commands.clickOnSubMenu
import Commands.clickOnTab
import Commands.enterDate
import Commands.enterText
import Commands.enterTextArea
import Commands.enterValues
import Commands.getValueFromTable
import Commands.selectAllFromTable
import Commands.selectCheckBox
import Commands.selectDropDownOption
import Commands.selectFromList
import Commands.selectFromTable
import Commands.selectRadioButton
import Commands.verifyAndSetToUnlimited
import Commands.verifyOnScreen
import Commands.verifyTableColumnHeaders
import Commands.verifyTextOnScreen
import Commands.verifyTextNotOnScreen
import Commands.verifyValueFromTable
import Commands.verifyResults
import Commands.clickOnPriority
import Module.Report
import Module.Utility
import Module.logger
import Commands.verifyTableRowCount

Excep = Class.UserDefinedException.UserDefinedException()


class Automation:
    def __init__(self) -> object:
        self.driver = Class.SeleniumBrowser.SeleniumBrowser()
        self.driver()

    # def selectDevice(self,device):
    #     self.mobiledriver.selectDevice(device)
    #
    # def launchApp(self,appName):
    #     self.mobiledriver.launchApp(appName)

    def openURL(self):
        self.driver.openUrl()

    def login(self):
        #Module.Report.Info(self.driver,"Login Page")
        self.driver.ifpageloaded()
        self.driver.login()
        Module.Report.Success(self.driver,"After Login")
    def performPreChecks(self):
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                self.driver.ifpageloaded()
                success = 1
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter + 1
                #self.driver.gotocorrectframe()

    def clickOnButton(self,buttonName,position=1):
        Module.logger.INFO("Clicking on button: "+buttonName)
        Module.Report.Info(self.driver, "Clicking on button: "+buttonName)
        self.buttonName = buttonName
        self.position = position
        self.performPreChecks()
        buttonName = Module.Utility.readTestData(buttonName)
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.ClickOnButton.clickOnButton(self.driver, buttonName,position)
                success = 1
                Module.Report.Success(self.driver, "Clicked on button: "+buttonName)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1

    def clickOnInfinityButton(self,lblName,unlimited=0):
        Module.logger.INFO("Clicking on inifinity button of: "+lblName)
        Module.Report.Info(self.driver, "Clicking on inifinity button of: "+lblName)
        self.lblName = lblName
        self.unlimited = unlimited
        self.performPreChecks()
        lblName = Module.Utility.readTestData(lblName)
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.clickOnInifinity.clickOnInifinityButton(self.driver,lblName,unlimited)
                success = 1
                Module.Report.Success(self.driver, "Clicked on inifinity button of: " + lblName)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1

    def clickOnMenu(self,menuName):
        Module.logger.INFO("Clicking on menu: "+menuName)
        Module.Report.Info(self.driver, "Clicking on menu: "+menuName)
        #Module.Reports.allure_test()
        self.menuName = menuName
        self.performPreChecks()
        menuName = Module.Utility.readTestData(menuName)
        #self.driver.gotodefaultframe()
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.clickOnMenu.clickOnMenu(self.driver, menuName)
                success = 1
                Module.Report.Success(self.driver, "Clicked on menu: " + menuName)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1

    def clickOnSubmeu(self,subMenuName):
        Module.logger.INFO("Clicking on submenu: "+subMenuName)
        Module.Report.Info(self.driver, "Clicking on submenu: "+subMenuName)
        self.subMenuName = subMenuName
        self.performPreChecks()
        #self.driver.gotodefaultframe()
        subMenuName = Module.Utility.readTestData(subMenuName)
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.clickOnSubMenu.clickOnSubmenu(self.driver, subMenuName)
                success = 1
                Module.Report.Success(self.driver, "Clicked on submenu: " + subMenuName)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1

    def clickOnTab(self,tabName):
        Module.logger.INFO("Clicking on tab: "+tabName)
        Module.Report.Info(self.driver, "Clicking on tab: "+tabName)
        #Module.Reports.allure_test()
        self.tabName = tabName
        self.performPreChecks()
        #self.driver.gotodefaultframe()
        tabName = Module.Utility.readTestData(tabName)
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.clickOnTab.clickOnTab(self.driver, tabName)
                success = 1
                Module.Report.Success(self.driver, "Clicked on tab: " + tabName)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1

    def enterText(self, textName, textValue):
        Module.logger.INFO ( "Entering text " + textValue + " for " + textName )
        self.textName = textName
        self.performPreChecks ()
        textName = Module.Utility.readTestData ( textName )
        textValue = Module.Utility.readTestData ( textValue )
        textValue = self.driver.getValueFromDic ( textValue )
        Module.Report.Info ( self.driver, "Entering text " + textValue + " for " + textName )
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.enterText.enterText ( self.driver, textName, textValue )
                success = 1
                Module.Report.Info ( self.driver, "Entered text " + textValue + " for " + textName )
            except selenium.common.exception:
                time.sleep ( 5 )
                success = 0
                counter = counter + 1

    def selectDropDownOption(self,menuName,optionName,action="select"):
        Module.logger.INFO("Selecting dropdown menu: "+menuName+ " and option "+optionName)
        self.menuName = menuName
        self.optionName = optionName
        menuName = Module.Utility.readTestData(menuName)
        optionName = Module.Utility.readTestData(optionName)
        Module.Report.Info(self.driver, "Selecting dropdown menu: "+menuName+ " and option "+optionName)
        self.performPreChecks()
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.selectDropDownOption.selectDropDownOption(self.driver, menuName, optionName,action)
                success = 1
                Module.Report.Success(self.driver, "Selecting dropdown menu: "+menuName+ " and option "+optionName)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1


    def verifyTextOnScreen(self,textName):
        Module.logger.INFO("Verifying if text: "+textName+ " is present on page")
        self.textName = textName
        self.performPreChecks()

        textName = Module.Utility.readTestData(textName)
        counter = 1
        success = 0
        Module.Report.Info(self.driver, "Verifying that text: " + textName + " is present on page")
        while ((success != 1) and (counter < 5)):
            try:
                Commands.verifyTextOnScreen.verifyTextOnScreen(self.driver, textName)
                success = 1
                Module.Report.Success(self.driver, "Verified that text: "+textName+ " is present on page")
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter + 1

    def verifyTextNotOnScreen(self,textName):
        Module.logger.INFO("Verifying if text: "+textName+ " is not present on page")
        self.textName = textName
        self.performPreChecks()

        textName = Module.Utility.readTestData(textName)
        counter = 1
        success = 0
        Module.Report.Info(self.driver, "Verifying that text: " + textName + " is not present on page")
        while ((success != 1) and (counter < 3)):
            try:
                obj=Commands.verifyTextNotOnScreen.verifyTextNotOnScreen(self.driver, textName)
                if(obj!= None):
                    success=1
                    Module.Report.Failure(self.driver, "Unexpected text : " + textName+" displayed on screen")
                    Excep.raiseException("Unexpected text : " + textName+" displayed on screen")

            except selenium.common.exceptions.StaleElementReferenceException:
               success = 0
            counter = counter + 1
        if(success==0):
            Module.Report.Success(self.driver, "Verified that text: " + textName + " is not present on page")


    def clickOnLink(self,lnkName):
        Module.logger.INFO("Clicking on link: " + lnkName)
        self.lnkName = lnkName
        self.performPreChecks()
        lnkName = Module.Utility.readTestData(lnkName)
        Module.Report.Info(self.driver, "Clicking on link: " + lnkName)
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.clickOnLink.clickOnLink(self.driver, lnkName)
                success = 1
                Module.Report.Success(self.driver, "Clicked on link: " + lnkName)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1


    def clickOnImage(self,imgName):
        Module.logger.INFO("Clicking on Image: " + imgName)
        self.imgName = imgName
        self.performPreChecks()
        imgName = Module.Utility.readTestData(imgName)
        Module.Report.Info(self.driver, "Clicking on Image: " + imgName)
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.clickOnImage.clickOnImage(self.driver, imgName)
                success = 1
                Module.Report.Success(self.driver, "Clicked on Image: " + imgName)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1


    def selectRadioButton(self,radbtnName,position=1):
        Module.logger.INFO("Clicking on Radio Button : " + radbtnName)
        self.radbtnName = radbtnName
        self.position = position
        self.performPreChecks()
        radbtnName = Module.Utility.readTestData(radbtnName)
        Module.Report.Info(self.driver, "Clicking on Radio Button : " + radbtnName)
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.selectRadioButton.selectRadioButton(self.driver, radbtnName,position)
                success = 1
                Module.Report.Success(self.driver, "Clicked on Radio Button : " + radbtnName)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1

    def clickOnInput(self,inputName,inputValue):
        Module.logger.INFO("Clicking on Input: "+inputName+ " and selecting value "+inputValue)
        #Module.Reports.allure_test()
        self.inputName = inputName
        self.inputValue = inputValue
        self.performPreChecks()
        inputName = Module.Utility.readTestData(inputName)
        inputValue = Module.Utility.readTestData(inputValue)
        Module.Report.Info(self.driver, "Clicking on Input: "+inputName+ " and selecting value "+inputValue)
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.clickOnInput.clickOnInput(self.driver, inputName, inputValue)
                success = 1
                Module.Report.Success(self.driver, "Clicked on Input: " + inputName + " and selected value " + inputValue)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1


    def selectFromList(self,optionName):
        Module.logger.INFO("selecting option: "+optionName)
        #Module.Reports.allure_test()
        self.optionName = optionName
        self.performPreChecks()
        optionName = Module.Utility.readTestData(optionName)
        counter = 1
        success = 0
        Module.Report.Info(self.driver, "selecting option: "+optionName)
        while ((success != 1) and (counter < 5)):
            try:
                Commands.selectFromList.selectFromList(self.driver, optionName)
                success = 1
                Module.Report.Success(self.driver, "selected option: " + optionName)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1


    def clickOnList(self,optionName):
        Module.logger.INFO("selecting option: "+optionName)
        #Module.Reports.allure_test()
        self.optionName = optionName
        self.performPreChecks()
        optionName = Module.Utility.readTestData(optionName)
        counter = 1
        success = 0
        Module.Report.Info(self.driver, "selecting option: " + optionName)
        while ((success != 1) and (counter < 5)):
            try:
                Commands.clickOnList.clickOnList(self.driver, optionName)
                success = 1
                Module.Report.Success(self.driver, "selected option: " + optionName)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1


    def logout(self):
        Module.Report.Info(self.driver, "Clicking on Logout")
        self.driver.logout()
        #Module.Report.Success(self.driver, "Clicked on Logout")

    def verifyTableColumnHeaders(self,tableName,ColNamesList):
        Module.logger.INFO("Getting Table Headers")
        self.tableName = tableName
        self.ColNamesList = ColNamesList
        self.performPreChecks()
        counter = 1
        success = 0
        Module.Report.Info(self.driver, "Getting Table Headers")
        while ((success != 1) and (counter < 5)):
            try:
                Commands.verifyTableColumnHeaders.verifyTableColumnHeaders(self.driver, tableName, ColNamesList)
                success = 1
                Module.Report.Success(self.driver, "Table Headers done")
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1

    def selectAllFromTable(self):
        Module.logger.INFO("Selecting All from Table ")
        self.performPreChecks()
        counter = 1
        success = 0
        Module.Report.Info(self.driver, "Selecting All from Table")
        while ((success != 1) and (counter < 5)):
            try:
                Commands.selectAllFromTable.selectAllFromTable(self.driver)
                success = 1
                Module.Report.Info(self.driver, "Selected All from Table")
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter + 1

    def selectFromTable(self,col_to_click,cols,rows):
        Module.logger.ERROR("Selecting " +col_to_click+ " from Table ")
        # Module.logger.INFO(cols)
        # Module.logger.INFO(rows)
        # Module.logger.INFO(col_to_click)
        self.performPreChecks()
        counter = 1
        success = 0
        Module.Report.Info(self.driver, "Selecting " +col_to_click+ " from Table ")
        while ((success != 1) and (counter < 5)):
            try:
                Commands.selectFromTable.selectFromTable(self.driver,col_to_click,cols,rows)
                success = 1
                Module.Report.Success(self.driver, "Selected " + col_to_click + " from Table ")
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter + 1

    def verifyValueFromTable(self,col_to_check,value_to_check,cols,rows):
        Module.logger.INFO("Verfiying value "+col_to_check+ " from table")
        self.performPreChecks()
        counter = 1
        success = 0
        Module.Report.Info(self.driver, "Verfiying value "+col_to_check+ " from table")
        while ((success != 1) and (counter < 5)):
            try:
                Commands.verifyValueFromTable.verifyValueFromTable(self.driver,col_to_check,value_to_check,cols,rows)
                success = 1
                Module.Report.Success(self.driver, "Verfiying value " + col_to_check + " from table")
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter + 1

    def getValueFromTable(self,col_to_check,cols,rows):
        Module.logger.INFO("Get value of "+col_to_check+ " from  table")
        self.performPreChecks()
        counter = 1
        success = 0
        Module.Report.Info(self.driver, "Get value of "+col_to_check+ " from  table")
        while ((success != 1) and (counter < 5)):
            try:
                got_value = Commands.getValueFromTable.getValueFromTable(self.driver,col_to_check,cols,rows)
                success = 1
                Module.Report.Success(self.driver, "Got value of " + col_to_check + " from  table")
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter + 1

        if success == 1:
            return got_value

    def clickOnHeaderOfTable(self,headerName):
        Module.logger.INFO("clicking on header "+headerName)
        self.performPreChecks()
        headerName = Module.Utility.readTestData(headerName)
        counter = 1
        success = 0
        Module.Report.Info(self.driver, "clicking on header "+headerName)
        while ((success != 1) and (counter < 5)):
            try:
                Commands.clickOnHeaderOfTable.clickOnHeaderOfTable(self.driver,headerName)
                success = 1
                Module.Report.Success(self.driver, "clicked on header "+headerName)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter + 1

    def getValueFromLabel(self,lblName,position=1):
        self.lblName = lblName
        self.position = position
        self.performPreChecks()
        Module.Report.Info(self.driver, "Getting value from label "+lblName)
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                label_value = self.driver.getValueFromLabel(lblName,position)
                success = 1
                Module.Report.Success(self.driver, "Got value from label " + lblName+ " and the value is "+label_value)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter + 1

        return label_value

    def addValueToDic(self, key, valueToAdd):
        self.driver.addValueToDic(key,valueToAdd)

    def compareTwoValues(self, value1, value2, operation):
        Module.logger.INFO("Comparing values ")
        self.driver.compareTwoValues(value1, value2, operation)
        Module.Report.Success(self.driver, "Comparing values was successfull")

    def enterDate(self,fieldName,fieldValue):
        self.fieldName = fieldName
        self.fieldValue = fieldValue
        if "today" in fieldValue:
            date = datetime.now().date()
        if "-" in fieldValue:
            tempValue = fieldValue.split("-")[1]
            tempValue = re.findall('\d+', tempValue)
            tempValue = int(tempValue[0])
            date = date + relativedelta(days=-tempValue)
        elif "+" in fieldValue:
            tempValue = fieldValue.split("+")[1]
            tempValue = re.findall('\d+', tempValue)
            tempValue = int(tempValue[0])
            date = date + relativedelta(days=+tempValue)
        self.performPreChecks()
        fieldName = Module.Utility.readTestData(fieldName)

        fieldValue = str(date)
        Module.Report.Info(self.driver, "Enter date "+ fieldValue +" for " + fieldName)
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.enterDate.enterDate(self.driver, fieldName, fieldValue)
                success = 1
                Module.Report.Success(self.driver, "Enter date " + fieldValue + " for " + fieldName)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1

    def enterDateOne(self,fieldName,fieldValue):
        self.fieldName = fieldName
        self.fieldValue = fieldValue
        self.performPreChecks()

        fieldName = Module.Utility.readTestData(fieldName)
        fieldValue = Module.Utility.readTestData(fieldValue)

        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.enterDate.enterDate(self.driver, fieldName, fieldValue)
                success = 1
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1

    def enterTextArea(self,fieldName,fieldValue):
        self.fieldName = fieldName
        self.fieldValue = fieldValue
        self.performPreChecks()
        fieldName = Module.Utility.readTestData(fieldName)
        fieldValue = Module.Utility.readTestData(fieldValue)
        Module.Report.Info(self.driver, "Enter text area " + fieldValue + " for " + fieldName)
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.enterTextArea.enterTextArea(self.driver, fieldName, fieldValue)
                success = 1
                Module.Report.Success(self.driver, "Enter text area " + fieldValue + " for " + fieldName)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1


    def selectCheckBox(self, chkBoxName):
        Module.logger.INFO("Clicking on Check Box : " + chkBoxName)
        self.chkBoxName = chkBoxName
        self.performPreChecks()
        chkBoxName = Module.Utility.readTestData(chkBoxName)
        Module.Report.Info(self.driver, "Clicking on Check Box : " + chkBoxName)
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.selectCheckBox.selectCheckBox(self.driver, chkBoxName)
                success = 1
                Module.Report.Success(self.driver, "Clicked on Check Box : " + chkBoxName)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1

    def verifyOnScreen(self, type,value):
        Module.logger.INFO("Verifying on screen : " + type +" "+ value)
        self.type = type
        self.value = value
        self.performPreChecks()
        value = Module.Utility.readTestData(value)
        Module.Report.Info(self.driver,"Verifying on screen : " + type +" "+ value)
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                found = Commands.verifyOnScreen.verifyOnScreen(self.driver,type,value)
                success = 1
                Module.Report.Success(self.driver, "Verifying on screen : " + type + " " + value)
                return found
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1

    def enterValues(self, rowName,colName,value= None,valueToStore=None):
        self.rowName = rowName
        self.colName = colName
        self.value = value
        self.performPreChecks()
        if value != None:
            Module.Report.Info(self.driver, "Enter value "+value+ " for "+rowName+ ", "+colName)
        if valueToStore != None:
            Module.Report.Info(self.driver, "Getting value stored in " + rowName + "and " + colName)
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.enterValues.enterValues(self.driver,rowName,colName,value,valueToStore)
                success = 1
                if value!= None:
                    Module.Report.Success(self.driver, "Enter value " + value + " for " + rowName + ", " + colName)
                if valueToStore != None:
                    Module.Report.Success(self.driver, "Getting value stored in " + rowName + "and " + colName)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1

    def clickOnExpandLink(self, expandLinkName, position=1):
        Module.logger.INFO("Clicking on expand link: " + expandLinkName)
        self.expandLinkName = expandLinkName
        self.performPreChecks()
        expandLinkName = Module.Utility.readTestData(expandLinkName)
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.clickOnExpandLink.clickOnExpandLink(self.driver, expandLinkName, position)
                success = 1
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter + 1

    def verifyAndSetToUnlimited(self,lblName):
        Module.logger.INFO("Verifying if "+lblName+ " is unlimited")
        self.lblName = lblName
        self.performPreChecks()
        lblName = Module.Utility.readTestData(lblName)
        Module.Report.Info(self.driver, "Verifying values" + lblName + " and set them to infinity")
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.verifyAndSetToUnlimited.verifyAndSetToUnlimited(self.driver,lblName)
                success = 1
                Module.Report.Success(self.driver, "Verifying values" + lblName + " and set them to infinity")
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1

    def verifyResults(self,values):
        Module.logger.INFO("Verifying results ")
        self.performPreChecks()

        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.verifyResults.verifyResults(self.driver,values)
                success = 1
                Module.Report.Success(self.driver, "Results verified and clicked based on given criteria")
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1

    def clickOnPriority(self,priority):
        Module.logger.INFO("Clicking on Priority" +priority)
        self.performPreChecks()

        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.clickOnPriority.clickOnPriority(self.driver,priority)
                success = 1
                Module.Report.Success(self.driver, "Clicked on Priority" +priority)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter +1

    def generateUniqueName(self, name):
        Module.logger.INFO ( "Generating unique name with text: " + name )
        self.name = name
        name = Module.Utility.readTestData ( name )
        dateNtime = datetime.now ().strftime ( '%d%m%y%H%M%S' )
        uniqueName = name + dateNtime
        Module.Report.Success ( self.driver, "Unique name created with text" + name )
        return uniqueName

    def verifyTableRowCount(self, rowcount):
        Module.logger.INFO("Verifying table row count is: " + rowcount)
        self.rowcount = rowcount
        self.performPreChecks()
        rowcount = Module.Utility.readTestData(rowcount)
        Module.Report.Info(self.driver, "Verifying table row count is: " + rowcount)
        counter = 1
        success = 0
        while ((success != 1) and (counter < 5)):
            try:
                Commands.verifyTableRowCount.verifyTableRowCount(self.driver, rowcount)
                success = 1
                Module.Report.Success(self.driver, "Verified the table rowcount is: " + rowcount)
            except selenium.common.exceptions.StaleElementReferenceException:
                time.sleep(5)
                success = 0
                counter = counter + 1