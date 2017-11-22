import Module.getObject
import Module.logger
import Module.Algorithms
import Module.Utility
import Class.Automation
import Module.CleanUp
import Module.Report
import Class.UserDefinedException

def verifyTableRowCount(self,rowCount):
    Excep = Class.UserDefinedException.UserDefinedException()
    tableRowCount = 0
    table_count = 0
    all_table = self.driver.find_elements_by_tag_name("table")
    for tab in all_table:
        table_class_name = tab.get_attribute("class")
        if table_class_name != "":
            if table_count == 1:
                col_table_obj = tab
                break
            table_count = table_count + 1
    ## Getting all rows of a table
    try:
       all_rows = col_table_obj.find_elements_by_tag_name("tr")
       tableRowCount = all_rows.__len__()
       Module.logger.ERROR("Table row count is:"+str(tableRowCount))
    except:
        Excep.raiseException("Exception occur in fetching row count")

    ## Once row found with given criteria. Perform action.
    if int(rowCount) == tableRowCount -1:
        Module.logger.INFO("Row count matched")
    else:
        Module.Report.Failure(self.driver, "Row count not matched")
        Excep.raiseException("Row count is not matching")