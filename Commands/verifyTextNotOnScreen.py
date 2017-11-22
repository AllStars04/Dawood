import sys
import Module.Algorithms
import Module.Utility
import Module.logger
import Module.getObject
import Module.CleanUp
#import Module.Report
import Class.UserDefinedException


def verifyTextNotOnScreen(driverObject,textName):
    Excep = Class.UserDefinedException.UserDefinedException()
    success = 0
    if textName == None:
        Module.logger.ERROR("Text to search not provided")
    obj = Module.getObject.getObjByRepo(driverObject, "statictext", textName)
    if obj != None:
     for divObj in obj:
         if divObj.text == textName:
            Module.logger.INFO("Unexpected Text Found : "+  textName)
            success = 1
            return divObj
            break
    else:
        Module.logger.INFO("Object " + textName + " is not found in Repository")

    if success == 0:
        obj = Module.getObject.getObjByAlgo(driverObject,"statictext",textName)
        if obj != None:
            Module.logger.INFO("Unexpected Text Found : " + textName)
            success = 1
            return obj
    if success == 0:
        Module.logger.INFO("Text "+textName+" is not found on screen")