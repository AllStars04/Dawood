import sys
import Class.SeleniumBrowser
import Module.MobileAlgorithms
import Module.Utility
import Module.logger
import Module.getMobileObject
import Module.CleanUp
import Class.UserDefinedException
import Module.Report

def tapMobileRadioOption(driverObject,optionName):
    Excep = Class.UserDefinedException.UserDefinedException()
    success = 0
    if optionName == None:
        Module.logger.ERROR("Option name not provided")
        Module.Report.Failure(driverObject,"Option name not provided")
        Excep.raiseException("Option name not provided")
    obj = Module.getMobileObject.getMobileObjByRepo(driverObject,"radiooption",optionName)
    if obj != None:
        try:
            obj.click()
            Module.logger.INFO("Option" + optionName + " is clicked")
            success = 1
        except:
            Module.logger.ERROR("Option "+optionName+ "is not clickable")
            Module.Report.Failure(driverObject,"Option "+optionName+ "is not clickable")
            Excep.raiseException("Option "+optionName+ "is not clickable")
    else:
        Module.logger.INFO("Object " +optionName+" is not found in Repository")

    if success == 0:
        obj = Module.getMobileObject.getMobileObjByAlgo(driverObject,"radiooption",optionName)
        if obj != None:
            try:
                obj.click()
                Module.logger.INFO("Option" + optionName + " is clicked")
            except:
                # Clean up before raising exception
                Module.CleanUp.killAllProcess()
                Module.logger.ERROR("Option " + optionName + "is not clickable")
                Module.Report.Failure(driverObject, "Option " + optionName + "is not clickable")
                Excep.raiseException("Option "+optionName+" is not clickable")
        else:
            Module.logger.ERROR("No Object found for option "+optionName)
            Module.Report.Failure(driverObject,"No Object found for option "+optionName)
            Excep.raiseException("No Object found for option "+optionName)