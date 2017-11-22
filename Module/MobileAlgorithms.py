import sys
import Module.Utility
import datetime
import time
import Module.logger


#nop changes until now since not used
def find_mobile_obj_using_config(self,idtype,idValue):

    Module.logger.INFO("Using config file with idtype "+idtype)
    try:
        if idtype == "name":
            return self.mobiledriver.find_element_by_name(idValue)
        elif idtype == "id":
            return self.mobiledriver.find_element_by_id(idValue)
        elif idtype == "class":
            return self.mobiledriver.find_elements_by_class_name(idValue)
        elif idtype == "tagname":
            return self.mobiledriver.find_elements_by_tag_name(idValue)
        elif idtype == "xpath":
            return self.mobiledriver.find_elements_by_xpath(idValue)
        elif idtype == "linktext":
            return self.mobiledriver.find_elements_by_link_text(idValue)
        elif idtype == "partiallinktext":
            return self.mobiledriver.find_elements_by_partial_link_text(idValue)
        elif idtype == "css":
            return self.mobiledriver.find_elements_by_css_selector(idValue)
        else:
            Module.logger.ERROR("Provided locator is not valid")
    except:
        Module.logger.ERROR("Object not found with given idtype and idvalue")

def find_mobile_auto_element(self,locator,locatorvalue,valuetype,value):
    found = "false"
    obj = None
    Module.logger.DEBUG("Searching for desired element with values LOCATOR: " +locator+ "LOCATOR VALUE: "+locatorvalue+ " and " + valuetype+": "+value)
    if locator == "css":
        all_obj = self.mobiledriver.find_elements_by_css_selector(locatorvalue)
    elif locator == "name":
        all_obj = self.mobiledriver.find_element_by_name(locatorvalue)
    elif locator == "xpath":
        all_obj = self.mobiledriver.find_elements_by_xpath(locatorvalue)
    elif locator == "linktext":
        all_obj = self.mobiledriver.find_elements_by_link_text(locatorvalue)
    elif locator == "partial_link_text":
        all_obj = self.mobiledriver.find_elements_by_partial_link_text(locatorvalue)
    elif locator == "tag_name":
        all_obj = self.mobiledriver.find_elements_by_tag_name(locatorvalue)
    elif locator == "class_name":
        all_obj = self.mobiledriver.find_elements_by_class_name(locatorvalue)
    elif locator == "css_selector":
        all_obj = self.mobiledriver.find_elements_by_css_selector(locatorvalue)

    else:
        all_obj = None
        Module.logger.ERROR("No valid locator found in config file.")


    if all_obj != None and locatorvalue != "img":
        for obj in all_obj:
            if value in obj.get_attribute(valuetype):
                Module.logger.DEBUG("During search we found the object with attribute "+valuetype+": " + obj.get_attribute(valuetype))
                found = "true"
            if found == "true":
                break

        if found == "true":
            return obj

    else:
        Module.logger.ERROR("Objects with parent locator: " + locator + " and locatorvalue: " + locatorvalue + " not found. Please train your locator module again.")
        return None


def find_mobile_auto_list_elements_withNoValue(self,locator,locatorvalue):
    found = "false"
    Module.logger.DEBUG("Searching for desired element with values LOCATOR: " +locator+ "and LOCATOR VALUE: "+locatorvalue)
    if locator == "css":
        all_obj = self.mobiledriver.find_elements_by_css_selector(locatorvalue)
    elif locator == "id":
        all_obj = self.mobiledriver.find_elements_by_id(locatorvalue)
    elif locator == "name":
        all_obj = self.mobiledriver.find_elements_by_name(locatorvalue)
    elif locator == "xpath":
        all_obj = self.mobiledriver.find_elements_by_xpath(locatorvalue)
    elif locator == "linktext":
        all_obj = self.mobiledriver.find_elements_by_link_text(locatorvalue)
    elif locator == "partial_link_text":
        all_obj = self.mobiledriver.find_elements_by_partial_link_text(locatorvalue)
    elif locator == "tag_name":
        all_obj = self.mobiledriver.find_elements_by_tag_name(locatorvalue)
    elif locator == "class_name":
        all_obj = self.mobiledriver.find_elements_by_class_name(locatorvalue)
    elif locator == "css_selector":
        all_obj = self.mobiledriver.find_elements_by_css_selector(locatorvalue)
    else:
        all_obj=None
        Module.logger.ERROR("No valid locator found in config file.")


    if all_obj != None:
        Module.logger.INFO("Object of list found")
        return all_obj

    else:
        Module.logger.ERROR("No list available on the screen")
        return None

def find_mobile_auto_element_withNoValue(self,locator,locatorvalue):
    found = "false"
    Module.logger.DEBUG("Searching for desired element with values LOCATOR: " +locator+ "and LOCATOR VALUE: "+locatorvalue)
    if locator == "css":
        obj = self.mobiledriver.find_element_by_css_selector(locatorvalue)
    elif locator == "id":
        obj = self.mobiledriver.find_element_by_id(locatorvalue)
    elif locator == "name":
        obj = self.mobiledriver.find_element_by_name(locatorvalue)
    elif locator == "xpath":
        obj = self.mobiledriver.find_element_by_xpath(locatorvalue)
    elif locator == "linktext":
        obj = self.mobiledriver.find_element_by_link_text(locatorvalue)
    elif locator == "partial_link_text":
        obj = self.mobiledriver.find_element_by_partial_link_text(locatorvalue)
    elif locator == "tag_name":
        obj = self.mobiledriver.find_element_by_tag_name(locatorvalue)
    elif locator == "class_name":
        obj = self.mobiledriver.find_element_by_class_name(locatorvalue)
    elif locator == "css_selector":
        obj = self.mobiledriver.find_element_by_css_selector(locatorvalue)
    else:
        obj=None
        Module.logger.ERROR("No valid locator found in config file.")


    if obj != None:
        Module.logger.INFO("Object of list found")
        return obj

    else:
        Module.logger.ERROR("No list available on the screen")
        return None

