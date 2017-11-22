import Module.Algorithms
import Module.Utility
import Module.logger
import Module.getObject
import Module.CleanUp
import Module.Report
import Class.UserDefinedException
import time

def selectRadioButton(driverObject,radbtnName,position=1):
    Excep = Class.UserDefinedException.UserDefinedException()
    success =0

    if radbtnName == None:
        Module.logger.ERROR("Radio Button name is not provided")
    #Get Object From Repository
    obj = Module.getObject.getObjByRepo(driverObject,"radiobutton",radbtnName)
    if obj!= None:
     try:
         obj.Click()
         Module.logger.INFO("Radio Button " + radbtnName + " is selected")
         success = 1
     except:
         Module.logger.ERROR("Radio Button " + radbtnName + "is not clickable")
    else:
        Module.logger.INFO("Object " + radbtnName + " is not found in Repository")

    if success == 0:
        if position == 1:
       #Get Object By Dynamic Algorithm
            obj = Module.getObject.getObjByAlgo(driverObject,"radiobutton",radbtnName)
            if obj != None:
                try:
                    obj.click()
                    Module.logger.INFO("Radio Button " + radbtnName + " is selected")
                except:
                    Module.CleanUp.killAllProcess()
                    Excep.raiseException("Radio Button " + radbtnName + "is not clickable")
            else:
                Module.logger.ERROR("No Object found for radio button " + radbtnName)
        else:
            Module.logger.DEBUG("Getting locator and locator value for radio button")
            locator, locatorvalue = Module.Utility.getDataForDynamicAlgo("radiobutton")
            if locator != None and locatorvalue != None:
                Module.logger.INFO("LOCATOR: " + locator + ", locatorvalue: " + locatorvalue + ", value: " + radbtnName)
                obj = Module.Algorithms.find_auto_element_on_position(driverObject, locator, locatorvalue, radbtnName, position)
                if obj != None:
                    try:
                        obj.click()
                        Module.logger.INFO("Radio Button " + radbtnName + " is selected in position "+radbtnName )
                    except:
                    #Module.CleanUp.killAllProcess()
                        Module.Report.Failure(driverObject,"Radio Button " + radbtnName + "is not clickable")
                        Excep.raiseException("Radio Button " + radbtnName + "is not clickable")
                else:
                    Module.Report.Failure(driverObject,"No Object found by generic algorithm for radio button "+radbtnName)
                    Excep.raiseException("No Object found by generic algorithm for radio button "+radbtnName)
            else:
                Module.Report.Failure(driverObject,"locator and locator value not provided in config file")
                Excep.raiseException("locator and locator value not provided in config file")
                #return None

