import sys
import Class.SeleniumBrowser
import Module.Algorithms
import Module.Utility
import Module.logger
import Module.getObject
import Module.CleanUp
import Module.Report
import Class.UserDefinedException


def clickOnPriority(self,priority):
    #Report = Class.Report.Report()
    Excep = Class.UserDefinedException.UserDefinedException()
    success = 0
    if priority == None:
        Module.logger.ERROR("Priority not provided")
    all_links = self.driver.find_elements_by_tag_name("a")
    for al in all_links:
        if al.get_attribute("data-rating-value") == priority:
            try:
                al.click()
                Module.logger.INFO("Priority" + priority + " is clicked")
                success = 1
                break
            except:
                success = 0
                Module.logger.ERROR("Priority" + priority + " is not clickable")
                Module.Report.Failure(self,"Priority" + priority + " is not clickable")
                Excep.raiseException("Priority" + priority + " is not clickable")

    if success == 0:
            Module.Report.Failure(self, "No Object found for Priority "+priority)
            Excep.raiseException("No Object found for Priority "+priority)