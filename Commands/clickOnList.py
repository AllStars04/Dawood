import sys
import Class.SeleniumBrowser
import Module.Algorithms
import Module.Utility
import Module.logger
import Module.getObject
import Module.CleanUp
import Module.Report
import Class.UserDefinedException

def clickOnList(driverObject,optionName):
    Excep = Class.UserDefinedException.UserDefinedException()
    success = 0
    if optionName == None:
        Module.logger.ERROR("Option name not provided")


    obj = Module.getObject.getObjByRepo(driverObject,"list",optionName)
    if obj != None:
        try:
            obj.click()
            success = 1
        except:
            Module.logger.ERROR("Option "+optionName+ "is not clickable")

    if success == 0:
        obj = Module.getObject.getObjByAlgo(driverObject,"list",optionName)
        if obj != None:
            try:
                ai = obj.find_elements_by_tag_name("span")
                for i in ai:
                    if(i.get_attribute("class").__contains__("expand-icon")):
                        i.click()
                        break
            except:
                Module.Report.Failure(driverObject,"option " + optionName + "is not clickable")
                Excep.raiseException("option " + optionName + "is not clickable")
        else:
            Module.Report.Failure(driverObject,"No Object found for option "+optionName)
            Excep.raiseException("No Object found for option "+optionName)