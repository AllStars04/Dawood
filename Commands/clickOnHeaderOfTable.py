import Module.getObject
import Module.logger
import Module.Algorithms
import Module.Utility
import Class.Automation
import Module.CleanUp
import Module.Report
import Class.UserDefinedException

def clickOnHeaderOfTable(self,headerName):
    Excep = Class.UserDefinedException.UserDefinedException()
    success = 0
    all_table = self.driver.find_elements_by_tag_name("table")
    for tab in all_table:
        table_class_name = tab.get_attribute("class")
        if table_class_name != "":
            table_obj = tab
            break

    if table_obj != None:
        all_cols = table_obj.find_elements_by_tag_name("th")
        if headerName != "lastcolumn":
            for col in all_cols:
                if col.text == headerName:
                    try:
                        col.click()
                        success = 1
                        break
                    except:
                        Module.logger.ERROR("Exception in clicking on header "+headerName)
                        success = 0
                        break
        else:
            ln = all_cols.__len__()
            colindex = ln - 1
            try:
                all_cols[colindex].find_element_by_xpath("following::button").click()
                success = 1
            except:
                Module.logger.ERROR("Exception in clicking on last column of header " )
                success = 0

        if success == 0:
            Module.Report.Failure(self.driver,"Header "+headerName+ " in table not found")
            Excep.raiseException("Header "+headerName+ " in table not found")
        else:
            Module.logger.INFO("Successfully clicked on header "+headerName)
    else:
        Module.Report.Failure(self.driver,"Table Not Found in page")
        Excep.raiseException("Table Not Found in page")

