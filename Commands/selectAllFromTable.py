import Module.getObject
import Module.logger
import Module.Algorithms
import Module.Utility
import Class.Automation
import Module.CleanUp
import Module.Report
import Class.UserDefinedException

def selectAllFromTable(self):
    Excep = Class.UserDefinedException.UserDefinedException()
    all_table = self.driver.find_elements_by_tag_name("table")
    for tab in all_table:
        table_class_name = tab.get_attribute("class")
        if table_class_name != "":
            table_obj = tab
            break

    if table_obj != None:
        all_cols = table_obj.find_elements_by_tag_name("th")
        for col in all_cols:
            if col.text == "":
                try:
                    col.click()
                    break
                except:
                    Module.Report.Failure(self.driver,"Column "+col.text+ " is not clickable")
                    Excep.raiseException("Column "+col.text+ " is not clickable")
    else:
        Module.Report.Failure(self.driver,"Table Not Found in page")
        Excep.raiseException("Table Not Found in page")
