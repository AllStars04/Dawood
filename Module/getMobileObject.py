import Module.Utility
import Module.MobileAlgorithms
import Module.logger



def getMobileObjByRepo(driverObject,type,name):
    idtype, idvalue = Module.Utility.CheckIfDefinedElementExistInRepo(type, name)
    if idtype != None and idvalue != None:
        Module.logger.INFO("ID Type for " +type+ " " +name+ " is " + idtype)
        Module.logger.INFO("Value for " + type + " " + name + " is " + idvalue)
        return Module.MobileAlgorithms.find_mobile_obj_using_config(driverObject,idtype, idvalue)
    else:
        return None

def getMobileObjByAlgo(driverObject,type,name):
    Module.logger.DEBUG("Getting locator and locator value for "+type)
    obj=None
    locator, locatorvalue = Module.Utility.getMobileDataForDynamicAlgo(type)
    i=0
    valuetype = "text"
    if type == "icon" or type =="imageButton":
        valuetype="contentDescription"
   # elif type == "textField" or type == "link" or type == "radiobutton":
    if locator != None and locatorvalue != None:
        all_locators = locator.split(sep=',')
        all_locatorvalues = locatorvalue.split(sep=',')
        for locator in all_locators:
            locatorvalue = all_locatorvalues[i]
            i = i+1
            Module.logger.INFO("LOCATOR: "+locator+ ", locatorvalue: " +locatorvalue+ ", "+valuetype+ ": "+name)
            obj =Module.MobileAlgorithms.find_mobile_auto_element(driverObject,locator, locatorvalue,valuetype, name)
            if obj != None:
                break
        return obj
    else:
        Module.logger.ERROR("Locator and locator value not provided in config file")
        return None


def getMobileObjByAlgo_ListWithNoValue(driverObject,type):
    Module.logger.DEBUG("Getting locator and locator value for "+type)
    locator, locatorvalue = Module.Utility.getMobileDataForDynamicAlgo(type)
    if locator != None and locatorvalue != None:
        Module.logger.INFO("LOCATOR: "+locator+ ", locatorvalue: " +locatorvalue)
        return Module.MobileAlgorithms.find_mobile_auto_list_elements_withNoValue(driverObject,locator, locatorvalue)
    else:
        Module.logger.ERROR("Locator and locator value not provided in config file")
        return None


def getMobileObjByAlgo_ObjectWithNoValue(driverObject,type):
    Module.logger.DEBUG("Getting locator and locator value for "+type)
    locator, locatorvalue = Module.Utility.getMobileDataForDynamicAlgo(type)
    if locator != None and locatorvalue != None:
        Module.logger.INFO("LOCATOR: "+locator+ ", locatorvalue: " +locatorvalue)
        return Module.MobileAlgorithms.find_mobile_auto_element_withNoValue(driverObject,locator, locatorvalue)
    else:
        Module.logger.ERROR("Locator and locator value not provided in config file")
        return None