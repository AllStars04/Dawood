import Module.logger
import Module.Report
import Module.getMobileObject
import Module.CleanUp
import os
import Class.UserDefinedException


Excep = Class.UserDefinedException.UserDefinedException()

def sendSMS(driverObject,deviceId,receiverNo,msgBody):
    try:
        draftSMScmd = "adb -s "+deviceId+" shell am start -a android.intent.action.SENDTO -d sms:"+receiverNo+" --es sms_body '"+msgBody+"' --ez exit_on_sent true"
        os.system(draftSMScmd)
        sendcmd="adb -s " + deviceId + " shell \"input keyevent 66 && input keyevent 22 && input keyevent 66 && input keyevent 22 && input keyevent 66\""
        os.system(sendcmd)

    except:
        Module.Report.Failure(driverObject, "Unable to draft sms to"+receiverNo)
        Module.logger.ERROR("SMS to no"+receiverNo+" is not send successfull")
        Excep.raiseException("SMS to no"+receiverNo+" is not send successfull")
