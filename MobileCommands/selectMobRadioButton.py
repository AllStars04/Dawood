import sys
import Module.MobileAlgorithms
import Module.Utility
import Module.logger
import Commands.enterText
import Module.getMobileObject
import Module.CleanUp
import Module.Report
import Class.UserDefinedException
Excep = Class.UserDefinedException.UserDefinedException()
def selectMobRadioButton(driverObject,radiobuttonName):
   list = Module.getMobileObject.getMobileObjByAlgo_ListWithNoValue(driverObject, "radiobuttonlist")
   if list != None:
        for each in list:
            tempcell = each.find_elements_by_xpath("//android.widget.RelativeLayout//android.widget.TextView")
            cell= tempcell[1]
            if cell.text == radiobuttonName:
                try:
                    obj = each.find_element_by_xpath("//android.widget.RadioButton")
                    obj.click()
                    found = "true"
                    break
                except:
                    Module.Report.Failure(driverObject,"Radiobutton is not clickable")
                    Module.logger.ERROR("Radiobutton is not clickable")
                    Excep.raiseException("Radiobutton is not clickable")

                if found == "true":
                    Module.logger.INFO("Clicked on Radiobutton"+ radiobuttonName)
                else:
                    Module.Report.Failure(driverObject,"Radio button "+radiobuttonName+" not available ")
                    Module.logger.ERROR("No Radio button is available with the text "+radiobuttonName)
                    Excep.raiseException("No Radio button is available with the text "+radiobuttonName)
   else:
       Module.Report.Failure(driverObject,"No list of radio buttons available on the screen")
       Module.logger.ERROR("No list of radio buttons available on the screen")
       Excep.raiseException("No list of radio buttons available on the screen")