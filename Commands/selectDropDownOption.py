import sys
import Module.Algorithms
import Module.Utility
import Module.logger
import Commands.enterText
import Module.getObject
import Module.CleanUp
import Module.Report
import Class.UserDefinedException
from selenium.webdriver.common.keys import Keys


def selectDropDownOption(driverObject, dropDownName, optionValue, action="select"):
    Excep = Class.UserDefinedException.UserDefinedException()
    success = 0
    if dropDownName == None or optionValue == None:
        Module.logger.ERROR("Drop down name or option not provided")
    tempobj = Module.getObject.getObjByRepo(driverObject, "dropdown", dropDownName)
    if tempobj != None:
        try:
            optionObj = tempobj.find_elements_by_xpath("following::option")
            for optObj in optionObj:
                if optObj.text == optionValue:
                    optObj.click()
                    success = 1
                    Module.logger.INFO(
                        "Drop Down Found. Selecting option  " + optionValue + " for the dropdown " + dropDownName)
                    break
        except:
            Module.logger.ERROR("Drop Down " + dropDownName + " is not clickable")


    if success == 0:
        try:
            parentObj = Module.getObject.getObjByAlgo(driverObject, "dropdown", dropDownName)
            divobj = parentObj.find_element_by_xpath("following::div")
            inputobj = divobj.find_element_by_tag_name("input")
            try:
                inputobj.click()
                try:
                        optionObj = divobj.find_elements_by_xpath("//li[@class = 'active-result group-option']")
                    #if len(optionObj) > 0:
                        for obj in optionObj:
                            if obj.text == optionValue:
                                try:
                                    obj.click()
                                    success = 1
                                    Module.logger.INFO(
                                        "Drop Down Found. Selecting option  " + optionValue + " for the dropdown " + dropDownName)
                                    break
                                except:
                                    Module.logger.ERROR("DropDown " + dropDownName + "is not clickable")
                except:
                    Module.logger.ERROR("No object found for the list")
            except:
                Module.logger.ERROR("Drop Down " + dropDownName + " is not clickable")
        except:
            Module.logger.ERROR("Div Element Not Found")


    if success == 0:
        tempobj = Module.getObject.getObjByAlgo(driverObject, "dropdown", dropDownName)
        try:
            tempobj1 = tempobj.find_elements_by_xpath("following::div")
            try:
                tempobj1[0].click()
                try:
                    obj1 = tempobj.find_elements_by_xpath("//li[@class = 'active-result']")
                    if len(obj1) > 0:
                        for obj in obj1:
                            if obj.text == optionValue:
                                try:
                                    obj.click()
                                    success = 1
                                    Module.logger.INFO(
                                        "Drop Down Found. Selecting option  " + optionValue + " for the dropdown " + dropDownName)
                                    break
                                except:
                                    Module.logger.ERROR("DropDown " + dropDownName + "is not clickable")
                    elif len(obj1) <= 0 or success == 0:
                        inputObj = tempobj1[0].find_elements_by_tag_name("input")
                        if len(inputObj) > 0:
                            try:
                                if action != "remove":
                                    inputObj[0].send_keys(Keys.BACK_SPACE)
                                    inputObj[0].send_keys(optionValue)
                                    inputObj[0].send_keys(Keys.ENTER)
                                    success = 1
                                    Module.logger.INFO(
                                        "Drop Down Found. Selecting option  " + optionValue + " for the dropdown " + dropDownName)
                                elif action == "remove":
                                    inputObj[0].send_keys(Keys.BACK_SPACE)
                                    success = 1
                                    Module.logger.INFO(
                                        "Drop Down Found. Removing option from the dropdown " + dropDownName)
                            except:
                                Module.logger.ERROR("Exception in selecting value from the dropdown field")
                except:
                    Module.logger.ERROR("No object found for the list")
            except:
                Module.logger.ERROR("Drop Down " + dropDownName + " is not clickable")
        except:
            Module.logger.ERROR("Div Element Not Found")

    if success == 0:
        tempobj = Module.getObject.getObjByAlgo(driverObject, "dropdown", dropDownName)
        if tempobj != None:
            try:
                optionObj = tempobj.find_elements_by_xpath("following::option")
                if optionObj:
                    for optObj in optionObj:
                        if optObj.text == optionValue:
                            optObj.click()
                            Module.logger.INFO(
                                "Drop Down Found. Selecting option  " + optionValue + " for the dropdown " + dropDownName)
                            break
                else:
                    optOb = tempobj.find_elements_by_tag_name("option")
                    for child in optOb:
                        if optionValue in child.text:
                            child.click()
                            Module.logger.INFO("Drop Down " + dropDownName + " is clicked ")
                            break
            except:
                Module.Report.Failure(driverObject, "Drop Down " + dropDownName + " is not clickable")
                Module.CleanUp.killAllProcess()
                Excep.raiseException("Drop Down " + dropDownName + " is not clickable")
        else:
            Module.Report.Failure(driverObject, "Drop Down " + dropDownName + " is not clickable")
            Module.CleanUp.killAllProcess()
            Excep.raiseException("Drop Down " + dropDownName + " is not clickable")
