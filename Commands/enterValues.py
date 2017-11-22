import sys
import Class.SeleniumBrowser
import Module.Algorithms
import Module.Utility
import Module.logger
import Module.getObject
import Module.CleanUp
import Class.UserDefinedException
from selenium.webdriver.common.keys import Keys


def enterValues(driverObject, rowName, ColName, value=None, valueToStore=None):
    Excep = Class.UserDefinedException.UserDefinedException()
    success = 0
    colNo = 0
    if value != None:
        value1 = value.split(sep='_')
        value1 = value1[len(value1) - 1]
    if rowName != None and ColName != None:
        obj = Module.getObject.getObjByAlgo(driverObject, "table", rowName)
        # Get Row Number from Column Name
        all_obj = Module.Algorithms.find_element_by_locator(driverObject, "tag_name", "th")
        for actObj in all_obj:
            colNo += 1
            if actObj.text == ColName:
                break
        if obj != None:
            nextObj = obj.find_element_by_xpath("following::td[" + str(colNo - 1) + "]")
            if value != None:
                if "Enter" in value:
                    inputObj = nextObj.find_elements_by_tag_name("input")
                    try:
                        inputObj[0].clear()
                        inputObj[0].send_keys(value1)
                        Module.logger.INFO("Entering Value " + value1 + " in the input field " + ColName)
                    except:
                        Module.CleanUp.killAllProcess()
                        Excep.raiseException("Exception in entering value in input field ")
                if "Dropdown" in value:
                    try:
                        divObj = nextObj.find_elements_by_tag_name("div")
                        divObj[0].click()
                    except:
                        Module.CleanUp.killAllProcess()
                        Excep.raiseException("Exception in clicking on the dropdown field")
                    try:
                        inputObj = divObj[0].find_elements_by_tag_name("input")
                        inputObj[0].send_keys(value1)
                        inputObj[0].send_keys(Keys.TAB)
                        Module.logger.INFO("Selecting Value " + value1 + " from the dropdown " + ColName)
                    except:
                        Module.CleanUp.killAllProcess()
                        Excep.raiseException("Exception in entering/selecting value in dropdown field")
            if valueToStore != None:
                if "text" in valueToStore:
                    try:
                        inputObj = nextObj.find_elements_by_tag_name("input")
                        driverObject.dic.update({valueToStore: inputObj[0].get_attribute("value")})
                        valueGot = driverObject.dic.get(valueToStore)
                        Module.logger.INFO("Value got for text at row "+rowName+" and column is" + str(valueGot))
                    except:
                        Module.CleanUp.killAllProcess()
                        Excep.raiseException("No Objects found for the input tag")
                if "drp" in valueToStore:
                    try:
                        divObj = nextObj.find_elements_by_tag_name("div")
                    except:
                        Module.CleanUp.killAllProcess()
                        Excep.raiseException("No Objects found for the div tag")
                    try:
                        spanObj = divObj[0].find_elements_by_tag_name("span")
                        driverObject.dic.update({valueToStore: spanObj[0].text})
                        valueGot = driverObject.dic.get(valueToStore)
                        Module.logger.INFO("Value got for text at row " + rowName + " and column is" + str(valueGot))
                    except:
                        Module.CleanUp.killAllProcess()
                        Excep.raiseException("No Objects found for the span tag")
        else:
            Excep.raiseException("No Object Found with Value" + value)

    else:
        Excep.raiseException("Rowname, colname and value to enter in the table are not provided")
