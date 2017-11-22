import Module.Algorithms
import Module.Utility
import Module.logger
import Module.getObject
import Module.CleanUp
import Module.Report
import Class.UserDefinedException
from selenium.webdriver.common.keys import Keys

def enterDate(driverObject,fieldName,fieldValue):
    Excep = Class.UserDefinedException.UserDefinedException()
    success = 0
    if fieldName == None or fieldValue == None:
        Module.logger.ERROR("Date Field  name or Value not provided")
    obj = Module.getObject.getObjByRepo(driverObject, "date", fieldName)
    if obj != None:
        try:
            obj.clear()
            obj.send_keys(fieldValue)
            obj.send_keys(Keys.TAB)
            success = 1
            Module.logger.INFO("Date Object Found. Entering Value for date " + fieldName + " with value " + fieldValue)
        except:
            Module.logger.ERROR("Exception in entering value using given locator and locator value")
    else:
        Module.logger.INFO("Object " + fieldName + " is not found in Repository")

    if success == 0:
        obj = Module.getObject.getObjByAlgo(driverObject,"date",fieldName)
        if obj != None:
            try:
                date_obj = obj.find_elements_by_xpath("following::input")
                try:
                    date_obj[0].clear()
                    date_obj[0].send_keys(str(fieldValue))
                    date_obj[0].send_keys(Keys.TAB)
                    Module.logger.INFO("Date Object Found. Entering Value for date "+fieldName+" with value "+str(fieldValue))
                except:
                    Module.Report.Failure(driverObject,"Exception in entering value in date field " + fieldName)
                    Module.CleanUp.killAllProcess()
                    Excep.raiseException("Exception in entering value in date field " + fieldName)
            except:
                Module.Report.Failure(driverObject,"Can't find date input box for " + fieldName)
                Module.CleanUp.killAllProcess()
                Excep.raiseException("Can't find date input box for " + fieldName)
        else:
            Module.Report.Failure(driverObject,"date field "+fieldName+ " not found")
            Excep.raiseException("No object found for date field "+fieldName)