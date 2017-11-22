import sys
import Module.Algorithms
import Module.Utility
import Module.logger
import Module.getObject
import Module.CleanUp
import Module.Report
import Class.UserDefinedException

def clickOnTab(driverObject,tabName):
    Excep = Class.UserDefinedException.UserDefinedException()
    success = 0
    if tabName == None:
        Module.logger.ERROR("Tab name not provided")
    obj = Module.getObject.getObjByRepo(driverObject,"tab",tabName)
    if obj != None:
        try:
            obj.click()
            Module.logger.INFO("Tab" + tabName + " is clicked")
            success = 1
        except:
            Module.logger.ERROR("Tab "+tabName+ "is not clickable")
    else:
        Module.logger.INFO("Object " + tabName + " is not found in Repository")

    if success == 0:
        obj = Module.getObject.getObjByAlgo(driverObject,"tab",tabName)
        if obj != None:
            try:
                obj.click()
                Module.logger.INFO("tab" + tabName + " is clicked")
            except:
                Module.Report.Failure(driverObject,"Tab " + tabName + "is not clickable")
                # Clean up before raising exception
                Module.CleanUp.killAllProcess()
                Excep.raiseException("Tab " + tabName + "is not clickable")
        else:
            Module.Report.Failure(driverObject,"Tab "+tabName+ " not found")
            Excep.raiseException("No Object found for tab "+tabName)