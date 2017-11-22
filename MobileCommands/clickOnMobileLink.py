import sys
import Class.MobileNative
import Module.MobileAlgorithms
import Module.Utility
import Module.logger
import Module.getMobileObject
import Module.CleanUp
import Class.UserDefinedException


def clickOnMobileLink(driverObject,linkName):
    Excep = Class.UserDefinedException.UserDefinedException()
    success = 0
    if linkName == None:
        Module.logger.ERROR("Link name not provided")
        Module.Report.Failure(driverObject, "Link name not provided")
        Excep.raiseException("Link name not provided")
    obj = Module.getMobileObject.getMobileObjByRepo(driverObject,"mobileLink",linkName)
    if obj != None:
        try:
            obj.click()
            Module.logger.INFO("Link" + linkName + " is clicked")
            success = 1
        except:
            Module.logger.ERROR("Link "+linkName+ "is not clickable")
            Module.Report.Failure(driverObject, "Link "+linkName+ "is not clickable")
            Excep.raiseException("Link "+linkName+ "is not clickable")
    else:
        Module.logger.INFO("Object " +linkName+" is not found in Repository")

    if success == 0:
        obj = Module.getMobileObject.getMobileObjByAlgo(driverObject,"mobileLink",linkName)
        if obj != None:
            try:
                obj.click()
                Module.logger.INFO("Link" + linkName + " is clicked")
            except:
                # Clean up before raising exception
                Module.CleanUp.killAllProcess()
                Module.logger.ERROR("Link " + linkName + "is not clickable")
                Module.Report.Failure(driverObject, "Link " + linkName + "is not clickable")
                Excep.raiseException("Link " + linkName + "is not clickable")
        else:
            Module.logger.ERROR("No Object found for link "+linkName)
            Module.Report.Failure(driverObject,"No Object found for link "+linkName)
            Excep.raiseException("No Object found for link "+linkName)