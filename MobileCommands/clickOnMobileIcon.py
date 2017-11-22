import sys
import Class.MobileNative
import Module.MobileAlgorithms
import Module.Utility
import Module.logger
import Module.getMobileObject
import Module.CleanUp
import Class.UserDefinedException


def clickOnMobileIcon(driverObject,iconName):
    Excep = Class.UserDefinedException.UserDefinedException()
    success = 0
    if iconName == None:
        Module.logger.ERROR("Icon name not provided")
        Module.Report.Failure(driverObject,"Icon name not provided")
        Excep.raiseException("Icon name not provided")
    obj = Module.getMobileObject.getMobileObjByRepo(driverObject,"icon",iconName)
    if obj != None:
        try:
            obj.click()
            Module.logger.INFO("Icon" + iconName + " is clicked")
            success = 1
        except:
            Module.Report.Failure(driverObject, "Icon with name " + iconName + " is not clickable")
            Module.logger.ERROR("Icon with name " + iconName + " is not clickable")
            Excep.raiseException("Icon with name " + iconName + " is not clickable")
    else:
        Module.logger.INFO("Object " +iconName+" is not found in Repository")

    if success == 0:
        obj = Module.getMobileObject.getMobileObjByAlgo(driverObject,"icon",iconName)
        if obj != None:
            try:
                obj.click()
                Module.logger.INFO("Icon" + iconName + " is clicked")
            except:
                # Clean up before raising exception
                Module.CleanUp.killAllProcess()
                Module.Report.Failure(driverObject,"Icon with name "+iconName+" is not clickable")
                Module.logger.ERROR("Icon with name "+iconName+" is not clickable")
                Excep.raiseException("Icon with name "+iconName+" is not clickable")
        else:
            Module.Report.Failure(driverObject,"No Object found for icon "+iconName)
            Module.logger.ERROR("No Object found for icon "+iconName)
            Excep.raiseException("No Object found for icon "+iconName)