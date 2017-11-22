import Module.Algorithms
import Module.Utility
import Module.logger
import Module.getObject
import Module.CleanUp
import Module.Report
import Class.UserDefinedException

def enterTextArea(driverObject,textAreaName,textAreaValue):
    Excep = Class.UserDefinedException.UserDefinedException()
    if textAreaName == None or textAreaValue == None:
        Module.logger.ERROR("Button name not provided")
    success = 0
    obj = Module.getObject.getObjByRepo(driverObject,"textarea",textAreaName)
    if obj != None:
        try:
            Module.logger.INFO("Finding Element based on given parameters")
            obj.clear()
            obj.send_keys(textAreaValue)
            Module.logger.INFO("Text Area " + textAreaName + "  is entered with text : "+textAreaValue)
            success = 1
        except:
            Module.logger.ERROR("Exception in entering value in text area using given locator and locator value")
    else:
        Module.logger.INFO("Object " +textAreaName+" is not found in Repository")

    if success == 0:
        obj = Module.getObject.getObjByAlgo(driverObject,"textarea",textAreaName)
        if obj != None:
            try:
                next_obj = obj.find_element_by_xpath("following::textarea")
                try:
                    next_obj.clear()
                    next_obj.send_keys(textAreaValue)
                    Module.logger.INFO("Text Area " + textAreaName + "  is entered with text : " + textAreaValue)
                except:
                    Module.Report.Failure(driverObject,"Exception in entering value in the textfield " + textAreaName)
                    Module.CleanUp.killAllProcess()
                    Excep.raiseException("Exception in entering value in the textfield " + textAreaName)
            except:
                Module.Report.Failure(driverObject,"Can't find input box for " + textAreaName)
                Module.CleanUp.killAllProcess()
                Excep.raiseException("Can't find input box for " + textAreaName)
        else:
            Module.Report.Failure(driverObject,"No object found for text area "+textAreaName)
            Excep.raiseException("No object found for text area "+textAreaName)

