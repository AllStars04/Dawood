import Module.MobileAlgorithms
import Module.Utility
import Module.logger
import Module.getMobileObject
import Module.CleanUp
import Class.UserDefinedException
import Module.Report

def entertTextToMobileField(driverObject,textFieldName,textValue):
    Excep = Class.UserDefinedException.UserDefinedException()
    if textFieldName == None or textValue == None:
        Module.logger.ERROR("Text field name not provided")
        Module.Report.Failure(driverObject,"Text field name not provided")
        Excep.raiseException("Text field name not provided")
    success = 0
    obj = Module.getMobileObject.getMobileObjByRepo(driverObject,"textfield",textFieldName)
    if obj != None:
        try:
            Module.logger.DEBUG("Clicking based on given parameters")
            obj.clear()
            obj.send_keys(textValue)
            Module.logger.INFO("Text object Found. Entering Value for text field " + textFieldName + " with value " + textValue)
            success = 1
        except:
            Module.logger.ERROR( "Exception in entering value in the textfield " + textFieldName)
            Module.Report.Failure(driverObject, "Exception in entering value in the textfield " + textFieldName)
            Excep.raiseException("Exception in entering value in the textfield " + textFieldName)
    else:
        Module.logger.INFO("Object " +textFieldName+" is not found in Repository")

    if success == 0:
        obj = Module.getMobileObject.getMobileObjByAlgo(driverObject,"textField",textFieldName)
        if obj != None:
            try:
                obj.clear()
                obj.send_keys(textValue)
                Module.logger.INFO("Text object Found. Entering Value for text field " + textFieldName + " with value " + textValue)
            except:
                #Clean up before raising exception
                #driverObject.close()
                Module.CleanUp.killAllProcess()
                Module.logger.ERROR("Exception in entering value in the textfield " + textFieldName)
                Module.Report.Failure(driverObject,"Exception in entering value in the textfield " + textFieldName)
                Excep.raiseException("Exception in entering value in the textfield " + textFieldName)

        else:
            Module.logger.ERROR("No object found for text "+textFieldName)
            Module.Report.Failure(driverObject,"No object found for text "+ textFieldName)
            Excep.raiseException("No object found for text "+textFieldName)

