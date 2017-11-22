import sys
import Class.SeleniumBrowser
import Module.Algorithms
import Module.Utility
import Module.logger
import Module.getObject
import Module.CleanUp
import Module.Report
import Class.UserDefinedException

def clickOnLink(driverObject,lnkName):
    Excep = Class.UserDefinedException.UserDefinedException()
    success = 0
    if lnkName == None:
        Module.logger.ERROR("Link name not provided")
    obj = Module.getObject.getObjByRepo(driverObject,"link",lnkName)
    if obj != None:
        try:
            obj.click()
            Module.logger.INFO("Link " + lnkName + " is selected")
            success = 1
        except:
            Module.logger.ERROR("Link "+lnkName+ "is not clickable")
    else:
        Module.logger.INFO("Object " + lnkName + " is not found in Repository")

    if success == 0:
        obj = Module.getObject.getObjByAlgo(driverObject,"link",lnkName)
        if obj != None:
            try:
                obj.click()
                Module.logger.INFO("Link " + lnkName + " is selected")
            except:
                Module.Report.Failure(driverObject,"Link " + lnkName + "is not clickable")
                # Clean up before raising exception
                Module.CleanUp.killAllProcess()
                Excep.raiseException("Link " + lnkName + "is not clickable")
        else:
            Module.Report.Failure(driverObject,"No link found "+lnkName)
            Excep.raiseException("No Object found for link "+lnkName)
