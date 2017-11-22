from behave import *
from behave.model import Scenario
from behave.model import ScenarioOutline

import Class.Automation
import Module.Report
import Module.Utility
import Module.logger
import Module.CleanUp
import Class.UserDefinedException
import re
import time
from datetime import datetime
from dateutil.relativedelta import relativedelta

#context.driver = Class.Automation.Automation()
Excep = Class.UserDefinedException.UserDefinedException()

@Given('test case starts')
def starttestcase(context):
    testCaseName = "All"
    reportType = Module.Utility.ReadDataFromJsonFile("tool", "reporttype")
    test_name = context.scenario.tags[0]
    feature_name = context.feature.tags[0]
    # Module.Report.initiateJVM()
    if reportType == "test":
        Module.Report.createTestReport(context.scenario.tags[0],context.scenario.tags[0],True)
    elif reportType == "feature":
        Module.Report.createTestReport(context.feature.tags[0],context.scenario.tags[0],False)
    else:
        Module.Report.createTestReport("Report",context.scenario.tags[0],False)

@Given('browser is open')
def openbrowser(context):
    context.driver.openURL()

@Then('login')
def login(context):
    context.driver.login()

@When('click on menu "{menuname}"')
def clickonmenu(context,menuname):
    context.driver.clickOnMenu(menuname)

@When('click on submenu "{submenuname}"')
def clickOnSubmeu(context,submenuname):
    context.driver.clickOnSubmeu(submenuname)

@When('click on input "{inputname}" and enter value "{inputValue}"')
def clickOnInput(context,inputname,inputValue):
    context.driver.clickOnInput(inputname,inputValue)

@Then('select from list "{optionname}"')
def clickonmenu(context,optionname):
    context.driver.selectFromList(optionname)

@Then('click on list "{optionname}"')
def clickOnList(context,optionname):
    context.driver.clickOnList(optionname)

@Then('verify text "{textname}"')
def verifytext(context,textname):
    context.driver.verifyTextOnScreen(textname)

@When('click on link "{linkname}"')
def clickonlink(context,linkname):
    context.driver.clickOnLink(linkname)

@When('click on button "{btnname}"')
def clickonButton(context, btnname):
    context.driver.clickOnButton(btnname)

@When('click on button "{btnname}" on position {position}')
def clickonButton(context, btnname,position):
    context.driver.clickOnButton(btnname,int(position))

@When ('click on infinity button of "{lblName}"')
def clickOnInifinityButton(context,lblName):
    context.driver.clickOnInfinityButton(lblName,0)

@Then ('set the value of "{lblName}" infinity')
def clickOnInifinityButton(context,lblName):
    context.driver.clickOnInfinityButton(lblName,1)

@When('click on tab "{tabname}"')
def clickonTab(context,tabname):
    context.driver.clickOnTab(tabname)

@Then('enter "{FieldName}" "{FieldValue}"')
def enterText(context, FieldName,FieldValue):
    context.driver.enterText(FieldName,FieldValue)

@Then('enter textarea "{FieldName}" "{FieldValue}"')
def enterTextArea(context, FieldName,FieldValue):
    context.driver.enterTextArea(FieldName,FieldValue)

@Then('select dropdown "{dropdownname}" "{optionname}"')
def selectDropDownOption(context,dropdownname,optionname):
    context.driver.selectDropDownOption(dropdownname,optionname)
	
@Then('validate table headers "{tableHeaders}" for table "{tableName}"')
def verifyTableColumnHeaders(context, tableName,tableHeaders):
    context.driver.verifyTableColumnHeaders(tableName,tableHeaders)

@Then('logout')
def logout(context):
    context.driver.logout()

@Then('report "{msg}"')
def info(context,msg):
    Module.logger.INFO(msg)

@Then('get value of "{lblName}" and store in "{storeValue}"')
def getValueFromLabelAndStore(context, lblName,storeValue):
    lblText = context.driver.getValueFromLabel(lblName)
    context.driver.addValueToDic(storeValue,lblText)

@Then('verify if "{value1}" "{operation}" "{value2}"')
def compareTwoValues(context,value1,value2,operation):
    context.driver.compareTwoValues(value1,value2,operation)

@Then('select drop down "{dropDownName}" "{optionValue}"')
def selectDropDown(context,dropDownName,optionValue):
    context.driver.selectDropDownOption(dropDownName,optionValue)

@Then('get all cols')
def getallcols(context):
    context.driver.getValueFromTable()

@Then('select check box "{chkboxName}"')
def selectCheckBox(context,chkboxName):
    context.driver.selectCheckBox(chkboxName)

@Then('select radiobutton "{radbtnName}"')
def selectRadioButton(context,radbtnName):
    context.driver.selectRadioButton(radbtnName)

@Then('select radiobutton "{radbtnName}" on position {position}')
def selectRadioButton(context,radbtnName,position):
    context.driver.selectRadioButton(radbtnName,int(position))

@Then('verify')
def step_impl(context):
    Module.logger.INFO(context.table.headings)
    for row in context.table:
        found = context.driver.verifyOnScreen(row['type'],row['value'])
        if found == False:
            Module.logger.ERROR("Verification of "+row['type']+ " "+row['value']+ " failed")
            break
    if found == True:
        Module.logger.INFO("All Verified successfully")
    else:
        Module.Report.Failure(context.driver,"All not verified on screen")
        Excep.raiseException("All not verified on screen")

@Then('verify any')
def step_impl(context):
    Module.logger.INFO(context.table.headings)
    for row in context.table:
        found = context.driver.verifyOnScreen(row['type'],row['value'])
        if found == True:
            Module.logger.INFO("Verification of "+row['type']+ " "+row['value']+ " passed")
            break

    if found == False:
        Excep.raiseException("Any verifcation failed")

@Then ('select all from table')
def step_impl(context):
    Module.logger.INFO("Then select all from table")
    context.driver.selectAllFromTable()

@Then ('click on header "{headername}"')
def clickOnHeader(context,headername):
    Module.logger.INFO("Then click on header "+headername)
    context.driver.clickOnHeaderOfTable(headername)

@Then ('click on "{col_name}" of table based on below criteria')
def step_impl(context,col_name):
    Module.logger.INFO("Then click on "+col_name+ " of table based on below criteria")
    context.driver.selectFromTable(col_name,context.table.headings,context.table.rows)

@Then ('verify value of "{col_name}" is "{value}" of table based on below criteria')
def step_impl(context,col_name,value):
    Module.logger.INFO("Then verify value of "+col_name+ " is" +value+" of table based on below criteria")
    context.driver.verifyValueFromTable(col_name,value,context.table.headings,context.table.rows)

@Then ('get value of "{col_name}" of table based on below criteria and store in "{storeValue}"')
def step_impl(context,col_name,storeValue):
    Module.logger.INFO("Then get value of "+col_name+ " of table based on below criteria and store in "+storeValue)
    got_value = context.driver.getValueFromTable(col_name,context.table.headings,context.table.rows)
    Module.logger.INFO("Stored value is "+got_value)
    context.driver.addValueToDic(storeValue, got_value)


@Then ('print following')
def step_impl(context):
    Module.logger.INFO(context.table.headings)
    Module.logger.INFO("===========")

    # for row in context.table:
    #     cols = row.__len__()
    #     while(cols > 0):
    #
    #     Module.logger.INFO(row.__len__())
    #     Module.logger.INFO("============")

@Then ('enter values')
def step_impl(context):
    for row in context.table:
        context.driver.enterValues(row['rowname'],row['colname'],row['value'])

@Then('get value of "{lblName}" on position {position} and store in "{storeValue}"')
def getValueFromLabelAndStore(context, lblName,position,storeValue):
    lblText = context.driver.getValueFromLabel(lblName,int(position))
    context.driver.addValueToDic(storeValue,lblText)

@Then('change sim "{imsivalue}" from "{initState}" to "{finalState}"')
def step_impl(context,imsivalue,initState,finalState):
    context.execute_steps("""
        When click on menu "Devices"
        When click on menu "All devices"
        Then verify text "Results"
        Then enter textarea "IMSI" "{imsivalue}"
        When click on button "Search"
        Then verify text "{initState}"
        Then click on "checkbox" of table based on below criteria
        |IMSI|
        |{imsivalue}|
        When click on link "Operations"
        When click on button "Next"
        Then select dropdown "* Action" "Change state"
        Then verify text "Batch operation"
        Then select dropdown "New State" "{finalState}"
        #Then select dropdown "State change reason" "End of contract"
        When click on button "Next"
        When click on button "Submit"
        Then verify text "The batch operation was successfully submitted"
        When click on button "Go to devices"
        Then verify text "{finalState}"
        Then report "State change is successful"
    """.format(imsivalue=imsivalue,initState=initState,finalState=finalState))

@Then('State change reason is mandatory "{imsivalue}" from "{initState}" to "{finalState}"')
def step_impl(context, imsivalue, initState, finalState):
    context.execute_steps("""
         When click on menu "Devices"
         When click on menu "All devices"
         Then verify text "Results"
         Then enter textarea "IMSI" "{imsivalue}"
         When click on button "Search"
         Then verify text "{initState}"
         Then click on "checkbox" of table based on below criteria
         |IMSI|
         |{imsivalue}|
         When click on link "Operations"
         When click on button "Next"
         Then select dropdown "* Action" "Change state"
         Then verify text "Batch operation"
         Then select dropdown "New State" "{finalState}"
         When click on button "Next"
         Then verify text "This is a mandatory field"
         Then report "Verified *State change reason is mandatory"
         Then select dropdown "State change reason" "Other"
         Then enter "StateChangeReason" "Test"
         When click on button "Next"
         When click on button "Submit"
         Then verify text "The batch operation was successfully submitted"
         When click on button "Go to devices"
         Then verify text "Devices"
         Then verify value of "State" is "{finalState}" of table based on below criteria
         |IMSI|
         |{imsivalue}|
         Then report "State change is successful"
     """.format(imsivalue=imsivalue, initState=initState, finalState=finalState))

@Then('verify below values and set to unlimited')
def verifyAndSetToUnlimited(context):
    for row in context.table:
        context.driver.verifyAndSetToUnlimited(row['LabelName'])

@Then('remove options "{optionname}" from dropdown "{dropdownname}"')
def selectDropDownOption(context,dropdownname,optionname):
    context.driver.selectDropDownOption(dropdownname,optionname,"remove")

@Then('enter date for "{fieldname}" "{fieldvalue}"')
def enterDate(context,fieldname,fieldvalue):
    context.driver.enterDate(fieldname,fieldvalue)

@Then('enter date "{dateFieldName}" "{dateFieldValue}"')
def enterDate(context,dateFieldName,dateFieldValue):
    Module.logger.INFO("dateFieldName:"+dateFieldName +"and dateFieldValue:"+dateFieldValue)
    context.driver.enterDateOne(dateFieldName,dateFieldValue)

@Then('get values of following from table and store')
def step_impl(context):
    for row in context.table:
        context.driver.enterValues(row['rowname'],row['colname'],None,row['valueToStore'])

@When('click on expand link "{expandLinkname}"')
def clickonExpandlink(context,expandLinkname):
    context.driver.clickOnExpandLink(expandLinkname)

@When('click on expand link "{expandLinkname}" on position {position}')
def clickOnExpandLink(context, expandLinkname,position):
    context.driver.clickOnExpandLink(expandLinkname,int(position))

@Then ('click on results based on below criteria')
def step_impl(context):
    values = []

    for r in context.table.rows:
        Module.logger.ERROR(r[0])
        #Module.logger.ERROR(rows['valueToStore'])
        values.append(r[0])

    context.driver.verifyResults(values)

@Then('store time in "{strtime}"')
def step_impl(context,strtime):
    strtimevalue = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    # strtimevalue = "2017-10-24 17:31:51"
    context.driver.addValueToDic(strtime, strtimevalue)

@Then ('click on priority "{priority}"')
def step_impl(context,priority):
    context.driver.clickOnPriority(priority)

@Then('verify no text "{textname}"')
def verifyNotext(context,textname):
    context.driver.verifyTextNotOnScreen(textname)

@Then ('validate table row count "{rowcount}"')
def verifyTableRowCount(context, rowcount):
    context.driver.verifyTableRowCount(rowcount)

@Then ( 'generate unique name starts with "{name}" and store in "{storeValue}"' )
def generateUniqueName(context, name, storeValue):
        uniqueName = context.driver.generateUniqueName ( name )
        context.driver.addValueToDic ( storeValue, uniqueName )


