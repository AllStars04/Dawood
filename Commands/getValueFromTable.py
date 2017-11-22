import Module.getObject
import Module.logger
import Module.Algorithms
import Module.Utility
import Class.Automation
import Module.CleanUp
import Module.Report
import Class.UserDefinedException

def getValueFromTable(self,col_to_check,colnames,rowvalues):
    Excep = Class.UserDefinedException.UserDefinedException()
    ## Get table names, 1st table is to get table headers and 2nd table is to get rest of the row
    matching_row = None
    for mr in rowvalues:
        Module.logger.INFO("Converting table rows into row")
        mr = Module.Utility.readTestData(str(mr))
        matching_row = mr

    table_count = 0
    all_table = self.driver.find_elements_by_tag_name("table")
    for tab in all_table:
        table_class_name = tab.get_attribute("class")
        if table_class_name != "":
            if table_count == 0:
                table_obj = tab
            if table_count == 1:
                col_table_obj = tab
                break
            table_count = table_count + 1
    ## read all headers and store in dictionary to map with keys (column number)
    if table_obj != None:
        all_cols = table_obj.find_elements_by_tag_name("th")
        col_index = 0
        col_dic = {}
        for col in all_cols:
            key = col_index
            value = col.text
            col_dic.update({key: value})
            col_index = col_index + 1
    else:
        Excep.raiseException("Table Not Found in page")

    ### Find index of column to click and index of matching criteria columns
    cols_index = []
    col_to_click_index = 0
    for key,value in col_dic.items():
        if value == col_to_check:
            col_to_click_index = key
        for col in colnames:
            if col == value:
                cols_index.append(key)

    Module.logger.INFO(cols_index)
    Module.logger.INFO(col_to_click_index)

    desired_row = None
    desired_row_found = 0
    ## Getting all rows of a table
    all_rows = col_table_obj.find_elements_by_tag_name("tr")

    ## Checking in all rows
    for row in all_rows:
        ## 1st row is empty so avoiding search on 1st row
        if row.get_attribute("class") != "":
            ## Getting all columns of a row
            all_cols = row.find_elements_by_tag_name("td")
            ## Checking given value exist in current row. Only checking the values of required columns which got earlier
            for rc in cols_index:
                if all_cols[rc].text in matching_row:
                    Module.logger.INFO("Column with value "+all_cols[rc].text+ " found")
                    desired_row_found = 1
                else:
                    desired_row_found = 0
            if desired_row_found == 1:
                desired_row = row
                break
    ## Once row found with given criteria. Perform action.
    if desired_row != None:
        Module.logger.INFO("Desired row found. Clicking on column "+str(col_to_check))
        try:
            all_c = row.find_elements_by_tag_name("td")
            return all_c[col_to_click_index].text
        except:
            Module.Report.Failure(self.driver,"Exception in finding data in row")
            Excep.raiseException("Exception in finding data in row")
    else:
        Module.Report.Failure(self.driver,"Desired row not found")
        Excep.raiseException("Desired row not found")