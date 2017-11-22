from datetime import datetime
from datetime import timedelta

import appium
from selenium.webdriver.common.by import By

import Module.logger
import Module.Report
import Module.getMobileObject
import Module.CleanUp
import os
import time
import Class.UserDefinedException
import selenium.webdriver.common.alert
import subprocess
import Module.Report


Excep = Class.UserDefinedException.UserDefinedException()

def sendSMS(driverObject,deviceId,receiverNo,msgBody):
    currsms=None
    timeStr1 = ""
    timeStr2 = ""
    try:

        draftSMScmd = "adb -s "+deviceId+" shell am start -a android.intent.action.SENDTO -d sms:"+receiverNo+" --es sms_body '"+msgBody+"' --ez exit_on_sent true"
        retCode = subprocess.call(draftSMScmd, shell=True)
        if (retCode != 0):
            Module.Report.Failure(driverObject, "Device " + deviceId + " is unavailable or invalid ReceiverNo: "+receiverNo+" or invalid Message: "+msgBody)
            Module.logger.ERROR("Device Id " + deviceId + " is unavailable or invalid ReceiverNo: "+receiverNo+" or invalid Message: "+msgBody)
            Excep.raiseException("Device Id " + deviceId + " is unavailable or invalid ReceiverNo: "+receiverNo+" or invalid Message: "+msgBody)
        sendcmd="adb -s " + deviceId + " shell \"input keyevent 66 && input keyevent 22 && input keyevent 66\""
        os.system(sendcmd)
        msgSentTime1=datetime.now().strftime('%H:%M')
        msgSentTime2=(datetime.now() - timedelta(minutes=1)).strftime('%H:%M')
        timeStr1="Sent: "+msgSentTime1
        timeStr2="Sent: "+msgSentTime2
    except OSError as e:
        Module.Report.Failure(driverObject, "SMS to no"+receiverNo+" is not send successfull")
        Module.logger.ERROR("SMS to no"+receiverNo+" is not send successfull")
        Excep.raiseException("SMS to no"+receiverNo+" is not send successfully.OS Error: "+e)
    time.sleep(3)
    firstmessage = Module.getMobileObject.getMobileObjByAlgo_ObjectWithNoValue(driverObject, "firstmessage")
    if firstmessage != None:
        try:
            firstmessage.click()

        except:
            Module.Report.Failure(driverObject, "First message is not clickable")
            Module.logger.ERROR("First message is not clickable")
            Excep.raiseException("First message is not clickable")

    else:
        Module.Report.Failure(driverObject, "Message app is closed before verifying delivery status")
        Module.logger.ERROR("Message app is closed before verifying delivery status")
        Excep.raiseException("Message app is closed before verifying delivery status")
    time.sleep(3)
    list = Module.getMobileObject.getMobileObjByAlgo_ListWithNoValue(driverObject, "messagebox")
    deliverystatus=None
    if list != None:
        for each in list:
            try:
                tempcell = each.find_elements_by_class_name("android.widget.TextView")
                currsms= tempcell[0]
                if(len(tempcell)==2):
                    currsmmstime=tempcell[1]
                elif(len(tempcell)==3):
                    currsmmstime = tempcell[2]

            except:
                continue
            if currsms.text.strip() == msgBody and (currsmmstime.text == timeStr1 or currsmmstime.text == timeStr2):
                try:
                    status = each.find_element_by_class_name("android.widget.LinearLayout")
                    deliverystatus=status.find_element_by_id("com.android.mms:id/delivered_indicator")
                    break

                except:
                    Module.Report.Failure(driverObject, "No delivery status displayed for the message sent")
                    Module.logger.ERROR("No delivery status displayed for the message sent")
                    Excep.raiseException("No delivery status displayed for the message sent")

        if deliverystatus!= None:
             Module.logger.INFO("Message is delivered successfully")
        else:
             Module.Report.Failure(driverObject, "Message is not delivered.\n Actual Sms:" + currsms.text + "   Expected Sms:" + msgBody+"\n Actual Sms time:" + currsmmstime.text + "   Expected:" + timeStr1 + "  or  " + timeStr2)
             Module.logger.ERROR("Message is not delivered.\n Actual Sms:" + currsms.text + "   Expected Sms:" + msgBody+"\n Actual Sms time:" + currsmmstime.text + "   Expected:" + timeStr1 + "  or  " + timeStr2)
             Excep.raiseException("Message is not delivered.\n Actual Sms:" + currsms.text + "   Expected Sms:" + msgBody+"\n Actual Sms time:" + currsmmstime.text + "   Expected:" + timeStr1 + "  or  " + timeStr2)

    else:
        Module.Report.Failure(driverObject, "No messages sent or received in the device")
        Module.logger.ERROR("No messages sent or received in the device")
        Excep.raiseException("No messages sent or received in the device")