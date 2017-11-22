import sys
import Module.Utility
import datetime
import time
import Module.logger

def find_obj_using_config(self,idtype,idValue):

    Module.logger.INFO("Using config file with idtype "+idtype)
    try:
        if idtype == "name":
            return self.driver.find_element_by_name(idValue)
        elif idtype == "id":
            return self.driver.find_element_by_id(idValue)
        elif idtype == "class":
            return self.driver.find_elements_by_class_name(idValue)
        elif idtype == "tagname":
            return self.driver.find_elements_by_tag_name(idValue)
        elif idtype == "xpath":
            return self.driver.find_elements_by_xpath(idValue)
        elif idtype == "linktext":
            return self.driver.find_elements_by_link_text(idValue)
        elif idtype == "partiallinktext":
            return self.driver.find_elements_by_partial_link_text(idValue)
        elif idtype == "css":
            return self.driver.find_elements_by_css_selector(idValue)
        else:
            Module.logger.ERROR("Provided locator is not valid")
    except:
        Module.logger.ERROR("Object not found with given idtype and idvalue")

def find_auto_element(self,locator,locatorvalue,value):
    found = "false"
    Module.logger.DEBUG("Searching for desired element with values LOCATOR: " +locator+ "LOCATOR VALUE: "+locatorvalue+ " and value: "+value)
    if locator == "css":
        all_obj = self.driver.find_elements_by_css_selector(locatorvalue)
    elif locator == "name":
        all_obj = self.driver.find_element_by_name(locatorvalue)
    elif locator == "xpath":
        all_obj = self.driver.find_elements_by_xpath(locatorvalue)
    elif locator == "linktext":
        all_obj = self.driver.find_elements_by_link_text(locatorvalue)
    elif locator == "partial_link_text":
        all_obj = self.driver.find_elements_by_partial_link_text(locatorvalue)
    elif locator == "tag_name":
        all_obj = self.driver.find_elements_by_tag_name(locatorvalue)
    elif locator == "class_name":
        all_obj = self.driver.find_elements_by_class_name(locatorvalue)
    elif locator == "css_selector":
        all_obj = self.driver.find_elements_by_css_selector(locatorvalue)
    else:
        Module.logger.ERROR("No valid locator found in config file.")


    if all_obj != None and locatorvalue != "img":
        for obj in all_obj:
            if value == obj.text:
                Module.logger.DEBUG("During search we found the object with attribute text: " + obj.text)
                found = "true"
            if found == "true":
                break
        if found == "true":
            return obj

        for obj in all_obj:
            if value in obj.text:
                Module.logger.DEBUG("During search we found the object with attribute text: " + obj.text)
                found = "true"
            if found == "true":
                break
        if found == "true":
            return obj
        if found == "false":
            all_obj = self.driver.find_elements_by_tag_name("input")
            for obj in all_obj:
                if value == obj.get_attribute("value"):
                    Module.logger.DEBUG("During search we found the object with attribute text: " + obj.text)
                    found = "true"
                if found == "true":
                    break
            if found == "true":
                return obj

            for obj in all_obj:
                if value in obj.get_attribute("value"):
                    Module.logger.DEBUG("During search we found the object with attribute text: " + obj.text)
                    found = "true"
                if found == "true":
                    break
            if found == "true":
                return obj
            else:
                Module.logger.ERROR("Object with given value "+value+ " not found")
                return None

    elif all_obj != None and locatorvalue == "img":
        for obj in all_obj:
            if value in obj.get_attribute("src"):
                Module.logger.DEBUG("During search we found the object with attribute " + obj.get_attribute("src"))
                found = "true"
            if found == "true":
                break
        if found == "true":
            return obj
        else:
            Module.logger.ERROR("Object with given value " + value + " not found")
            return None
    else:
        Module.logger.ERROR("Objects with parent locator: " + locator + " and locatorvalue: " + locatorvalue + " not found. Please train your locator module again.")
        return None

def find_auto_element_on_position(self,locator,locatorvalue,value,position = 1):
    currentposition = 1
    found = "false"
    Module.logger.DEBUG("Searching for desired element with values LOCATOR: " +locator+ "LOCATOR VALUE: "+locatorvalue+ " and value: "+value)
    if locator == "css":
        all_obj = self.driver.find_elements_by_css_selector(locatorvalue)
    elif locator == "name":
        all_obj = self.driver.find_element_by_name(locatorvalue)
    elif locator == "xpath":
        all_obj = self.driver.find_elements_by_xpath(locatorvalue)
    elif locator == "linktext":
        all_obj = self.driver.find_elements_by_link_text(locatorvalue)
    elif locator == "partial_link_text":
        all_obj = self.driver.find_elements_by_partial_link_text(locatorvalue)
    elif locator == "tag_name":
        all_obj = self.driver.find_elements_by_tag_name(locatorvalue)
    elif locator == "class_name":
        all_obj = self.driver.find_elements_by_class_name(locatorvalue)
    elif locator == "css_selector":
        all_obj = self.driver.find_elements_by_css_selector(locatorvalue)
    else:
        Module.logger.ERROR("No valid locator found in config file.")


    if all_obj != None and locatorvalue != "img":
        for obj in all_obj:
            if obj.text == value:
                if currentposition == position:
                    Module.logger.DEBUG("During search we found the object with attribute text: " + obj.text)
                    found = "true"
                else:
                    currentposition = currentposition+1
            if found == "true":
                break
        if found == "true":
            return obj
        else:
            Module.logger.ERROR("Object with given value "+value+ " not found")
            return None

def find_element_by_locator(self, locator, locatorvalue):
    Module.logger.DEBUG("Searching for desired element with values LOCATOR: " + locator + "LOCATOR VALUE: " + locatorvalue)
    try:
        if locator == "css":
           return self.driver.find_elements_by_css_selector(locatorvalue)
        elif locator == "name":
            return self.driver.find_element_by_name(locatorvalue)
        elif locator == "xpath":
            return self.driver.find_elements_by_xpath(locatorvalue)
        elif locator == "linktext":
            return self.driver.find_elements_by_link_text(locatorvalue)
        elif locator == "partial_link_text":
            return self.driver.find_elements_by_partial_link_text(locatorvalue)
        elif locator == "tag_name":
            return self.driver.find_elements_by_tag_name(locatorvalue)
        elif locator == "class_name":
            return self.driver.find_elements_by_class_name(locatorvalue)
        elif locator == "css_selector":
            return self.driver.find_elements_by_css_selector(locatorvalue)
    except:
        Module.logger.ERROR("Object not found with given idtype and idvalue")

