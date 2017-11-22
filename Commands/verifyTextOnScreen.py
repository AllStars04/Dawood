import sys
import Module.Algorithms
import Module.Utility
import Module.logger
import Module.getObject
import Module.CleanUp
import Module.Report
import time
import Class.UserDefinedException

def verifyTextOnScreen(self,textName):
    Excep = Class.UserDefinedException.UserDefinedException()
    success = 0
    if textName == None:
        Module.logger.ERROR("Text to search not provided")
    # obj = Module.getObject.getObjByRepo(driverObject, "statictext", textName)
    # if obj != None:
    #  for divObj in obj:
    #      if divObj.text == textName:
    #         Module.logger.INFO("Static Text Found : "+  textName)
    #         success = 1
    #         break
    # else:
    #     Module.logger.INFO("Object " + textName + " is not found in Repository")
    #
    # if success == 0:
    #     obj = Module.getObject.getObjByAlgo(driverObject,"statictext",textName)
    #     if obj != None:
    #         Module.logger.INFO("Static Text Found : " + textName)
    #         success = 1
    #     else:
    #         Module.Report.Failure(driverObject,"Text Not found : "+textName)
    #         Excep.raiseException("Text Not found : "+textName)
    # #
    count = 0
    found = "false"
    timeout = Module.Utility.ReadDataFromJsonFile("tool", "timeout")

    while found == "false" and count < timeout:
        all_text = self.driver.find_element_by_tag_name("body").text
        try:
            assert textName in all_text ,Module.logger.ERROR("Text not found")
            found = "true"
        except:
            found = "false"
            count = count + 2
            time.sleep(2)


    if found == "false":
        Module.logger.ERROR("Text "+textName+" not found in web page")
        Module.Report.Failure(self,"Text "+textName+" not found in web page")
        Excep.raiseException("Text "+textName+"not found in web page")
    else:
        Module.logger.INFO("Text " + textName + " found in web page")
        Module.Report.Success(self, "Text " + textName + " found in web page")


