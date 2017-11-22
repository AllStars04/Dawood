import Module.Algorithms
import Module.Utility
import Module.logger
import Module.getObject
import Module.CleanUp
import Module.Report
import Class.UserDefinedException

def selectCheckBox(driverObject,chkboxName):
    Excep = Class.UserDefinedException.UserDefinedException()
    success =0
    if chkboxName == None:
        Module.logger.ERROR("Check Box name is not provided")
    #Get Object From Repository
    obj = Module.getObject.getObjByRepo(driverObject,"checkbox",chkboxName)
    if obj!= None:
     try:
         obj.Click()
         Module.logger.INFO("Check box " + chkboxName + " is selected")
         success = 1
     except:
         Module.logger.ERROR("Check box " + chkboxName + "is not clickable")
    else:
        Module.logger.INFO("Object " + chkboxName + " is not found in Repository")

    if success == 0:
       #Get Object By Dynamic Algorithm
       obj = Module.getObject.getObjByAlgo(driverObject,"checkbox",chkboxName)
       if obj != None:
           try:
               obj.click()
               Module.logger.INFO("Check box " + chkboxName + " is selected")
           except:
               Module.Report.Failure(driverObject,"Check box " + chkboxName + "is not clickable")
               Module.CleanUp.killAllProcess()
               Excep.raiseException("Check box " + chkboxName + "is not clickable")
       else:
           Module.Report.Failure(driverObject,"No Object found for check box " + chkboxName)
           Excep.raiseException("No Object found for check box " + chkboxName)

