import Module.MobileAlgorithms
import Module.Utility
import Module.logger
import Module.getMobileObject
import Module.CleanUp
import Class.UserDefinedException
import Module.Report

def enterTextOnMobile(driverObject,textValue):
    Excep = Class.UserDefinedException.UserDefinedException()
    if textValue == None:
        Module.logger.ERROR("Text value not provided")
        Module.Report.Failure(driverObject, "Text value not provided")
        Excep.raiseException("Text value not provided")
    success = 0
    obj = Module.getMobileObject.getMobileObjByAlgo_ObjectWithNoValue(driverObject,"textfield")
    if obj != None:
        try:
            Module.logger.DEBUG("Entering value to text field")
            obj.clear()
            obj.send_keys(textValue)
            Module.logger.INFO("Text object Found. Entering Value" + textValue+ " for text field" )
            success = 1
        except:
            Module.logger.ERROR("Exception in entering text to field")
            Module.Report.Failure(driverObject,"Exception in entering text to field")
            Excep.raiseException("Exception in entering text to field")
    else:
        Module.logger.INFO("Object for textfield is not found in Repository")

    if success == 0:
        obj = Module.getMobileObject.getMobileObjByAlgo_ObjectWithNoValue(driverObject,"textField")
        if obj != None:
            try:
                obj.clear()
                obj.send_keys(textValue)
                Module.logger.INFO("Text object Found. Entering Value " + textValue + " for text field")
            except:
                Module.CleanUp.killAllProcess()
                Module.logger.ERROR("Exception in entering text to field")
                Module.Report.Failure(driverObject, "Exception in entering text to field")
                Excep.raiseException("Exception in entering text to field")

        else:
            Module.logger.ERROR("No object found for textfield")
            Module.Report.Failure(driverObject,"No object found for textfield")
            Excep.raiseException("No object found for textfield")

