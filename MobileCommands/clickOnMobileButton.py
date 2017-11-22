import sys
import Class.SeleniumBrowser
import Module.MobileAlgorithms
import Module.Utility
import Module.logger
import Module.getMobileObject
import Module.CleanUp
import Class.UserDefinedException
import Module.Report


def clickOnMobileButton(driverObject,buttonName):
    Excep = Class.UserDefinedException.UserDefinedException()
    success = 0
    if buttonName == None:
        Module.logger.ERROR("Button name not provided")
        Module.Report.Failure(driverObject,"Button name not provided")
        Excep.raiseException("Button name not provided")
    obj = Module.getMobileObject.getMobileObjByRepo(driverObject,"button",buttonName)
    if obj != None:
        try:
            obj.click()
            Module.logger.INFO("Button" + buttonName + " is clicked")
            success = 1
        except:
            Module.logger.ERROR("Button "+buttonName+ "is not clickable")
            Module.Report.Failure(driverObject,"Button "+buttonName+ "is not clickable")
            Excep.raiseException("Button "+buttonName+ "is not clickable")
    else:
        Module.logger.INFO("Object " +buttonName+" is not found in Repository")

    if success == 0:
        obj = Module.getMobileObject.getMobileObjByAlgo(driverObject,"button",buttonName)
        if obj != None:
            try:
                obj.click()
                Module.logger.INFO("Button" + buttonName + " is clicked")
            except:
                # Clean up before raising exception
                Module.CleanUp.killAllProcess()
                Module.logger.ERROR("Button " + buttonName + "is not clickable")
                Module.Report.Failure(driverObject, "Button " + buttonName + "is not clickable")
                Excep.raiseException("Button "+buttonName+" is not clickable")
        else:
            Module.logger.ERROR("No Object found for button "+buttonName)
            Module.Report.Failure(driverObject,"No Object found for button "+buttonName)
            Excep.raiseException("No Object found for button "+buttonName)