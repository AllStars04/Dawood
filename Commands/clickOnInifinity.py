import sys
import Class.SeleniumBrowser
import Module.Algorithms
import Module.Utility
import Module.logger
import Module.getObject
import Module.CleanUp
import Module.Report
import Class.UserDefinedException


def clickOnInifinityButton(driverObject,lblName,unlimited=0):
    #Report = Class.Report.Report()
    Excep = Class.UserDefinedException.UserDefinedException()
    success = 0
    if lblName == None:
        Module.logger.ERROR("Label name not provided")
    obj = Module.getObject.getObjByRepo(driverObject,"button",lblName)
    if obj != None:
        try:
            obj.click()
            Module.logger.INFO("Inifinity Button" + lblName + " is clicked")
            success = 1
        except:
            Module.logger.ERROR("Inifinity Button "+lblName+ "is not clickable")
    else:
        Module.logger.INFO("Object " +lblName+" is not found in Repository")

    if success == 0:
        obj = Module.getObject.getObjByAlgo(driverObject,"text",lblName)
        if obj != None:
            try:
                if unlimited == 0:
                    if obj.find_element_by_xpath("following::input").is_enabled() == False:
                        Module.logger.INFO("Clicking on Infinity button to remove unlimited value")
                        obj.find_element_by_xpath("following::a").click()
                else:
                    Module.logger.INFO("Clicking on Infinity button to set unlimited value")
                    obj.find_element_by_xpath("following::a").click()
            except:
                Module.Report.Failure(driverObject,"Exception in clicking on INFINITY Button")
                Excep.raiseException("Exception in clicking on INFINITY Button")
        else:
            Module.Report.Failure(driverObject," "+lblName+ " not found")
            Excep.raiseException("Object for "+lblName+ " not found using dynamic algorithm")