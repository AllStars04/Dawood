import sys
import Module.MobileAlgorithms
import Module.Utility
import Module.logger
import Module.getMobileObject
import Module.CleanUp
import Module.Report
import Class.UserDefinedException

def verifyTextOnMobileScreen(driverObject,textName):
    Excep = Class.UserDefinedException.UserDefinedException()
    success = 0
    if textName == None:
        Module.logger.ERROR("Text to search not provided")
        Module.Report.Failure(driverObject,"Text to search not provided")
        Excep.raiseException("Text to search not provided")
    obj = Module.getMobileObject.getMobileObjByRepo(driverObject, "label", textName)
    if obj != None:
     for divObj in obj:
         if divObj.text == textName:
            Module.logger.INFO("Static Text Found : "+  textName)
            success=1
            return success

         else:
             Module.logger.INFO("Object " + textName + " is not found in Repository")

    if success == 0:
        obj = Module.getMobileObject.getMobileObjByAlgo(driverObject,"label",textName)
        if obj != None:
            Module.logger.INFO("Static Text Found : " + textName)
            success = 1
            return success

        else:
            Module.logger.ERROR("Text Not found : " + textName + " not available ")
            Excep.raiseException("Text Not found : " + textName + " not available ")



