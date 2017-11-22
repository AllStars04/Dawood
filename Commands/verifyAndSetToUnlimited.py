import sys
import Class.SeleniumBrowser
import Module.Algorithms
import Module.Utility
import Module.logger
import Module.getObject
import Module.CleanUp
import Module.Report
import Class.UserDefinedException


def verifyAndSetToUnlimited(driverObject,LabelName):
    #Report = Class.Report.Report()
    Excep = Class.UserDefinedException.UserDefinedException()
    success = 0
    if LabelName == None:
        Module.logger.ERROR("Label name not provided")
    obj = Module.getObject.getObjByRepo(driverObject,"button",LabelName)
    if obj != None:
        try:
            obj.click()
            Module.logger.INFO("Inifinity Button" + LabelName + " is clicked")
            success = 1
        except:
            Module.logger.ERROR("Inifinity Button "+LabelName+ "is not clickable")
    else:
        Module.logger.INFO("Object " +LabelName+" is not found in Repository")

    if success == 0:
        obj = Module.getObject.getObjByAlgo(driverObject,"text",LabelName)
        if obj != None:
            try:
                if obj.find_element_by_xpath("following::input").is_enabled() == False:
                    Module.logger.INFO("The value "+LabelName+" is already unlimited")
                else:
                    Module.logger.INFO("Clicking on Infinity button to set unlimited value for "+LabelName)
                    obj.find_element_by_xpath("following::a").click()

            except:
                Module.Report.Failure(driverObject,"Exception in clicking on INFINITY Button")
                Excep.raiseException("Exception in clicking on INFINITY Button")
        else:
            Module.Report.Failure(driverObject,"Object for "+LabelName+ " not found using dynamic algorithm")
            Excep.raiseException("Object for "+LabelName+ " not found using dynamic algorithm")