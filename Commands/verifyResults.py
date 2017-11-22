import Module.getObject
import Module.logger
import Module.Algorithms
import Module.Utility
import Class.Automation
import Module.CleanUp
import Module.Report
import Class.UserDefinedException
import Class.SeleniumBrowser
import re
import time
from datetime import datetime
from dateutil.relativedelta import relativedelta

def verifyResults(self,values):
    Module.logger.ERROR("Values are "+str(values))
    Excep = Class.UserDefinedException.UserDefinedException()
    ## Get object of results table. its not in table format so getting based on class
    all_rows = self.driver.find_elements_by_class_name("section_history")
    ## Getting 1st row of the result page
    for rows in all_rows:
        ## Verify if row contains data
        Module.logger.ERROR("Verifying for the row" +rows.text)
        for vall in values:
            val = Module.Utility.readTestData(str(vall))
            Module.logger.ERROR("Value to verify is "+str(val))
            newvalue = self.getValueFromDic(val)
            newvalue = str(newvalue)
            Module.logger.ERROR("Final value to verify is "+newvalue)
            if newvalue.__contains__(":"):
                try:
                    match = re.search(r'\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}', rows.text)
                    date_on_result = match.group()
                    Module.logger.ERROR("GOT DATE is" +date_on_result)
                    if date_on_result > newvalue:
                        Module.logger.ERROR("Date matched ========")
                        success = 1
                    else:
                        Module.logger.ERROR("Date not matched ========")
                        success = 0
                        break
                except:
                    Module.logger.ERROR("Exception : Date not matched ========")
                    success = 0
                    break
            else:
                if newvalue in rows.text:
                    Module.logger.ERROR("Matched ======== "+newvalue)
                    success = 1
                else:
                    Module.logger.ERROR("Not Matched ======== " + newvalue)
                    success = 0

        if (success == 1):
            targetObj = rows
            break

    if (success == 1):
        try:
            Module.logger.INFO("Results found , clicking")
            Module.logger.ERROR("Results found , clicking on row "+targetObj.text)
            targetObj.click()
            Module.logger.INFO("Results found , clicked")
            Module.Report.Success(self,"Results found , clicked")
        except:
            Module.logger.ERROR("ERROR in clicking")
            Module.Report.Failure(self,"ERROR in clicking on results")
            Excep.raiseException("ERROR in clicking on results")
    else:
        Module.logger.ERROR("Results not found based on given criteria")
        Module.Report.Failure(self,"Results not found based on given criteria")
        Excep.raiseException("Results not found based on given criteria")



