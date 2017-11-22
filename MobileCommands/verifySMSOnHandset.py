import Module.logger
import Module.Report
import time
import errno
from pathlib import Path
import os
import Class.UserDefinedException


cwd = os.getcwd()
pcwd = "\\".join(cwd.split('\\')[:-1])
mobdir = cwd + "\\logs"
try:
    dirExists = os.path.exists(mobdir)
    if not dirExists:
        mobdir = pcwd + "\\logs"
except OSError as exception:
        if exception.errno != errno.EEXIST:
            raise

strtsxtPath = mobdir+"\\tsxt.txt"
Excep = Class.UserDefinedException.UserDefinedException()

def verifySMSOnHandset(driverObject,deviceName,smsTextToVerify):

    #Copy the SMS from device to test file
    strSleepCmd = "adb -s " + deviceName + " shell sleep 10"
    os.system(strSleepCmd)
    strCopySMSCmd = "adb -s " + deviceName + " pull /sdcard/tsxt.txt " + mobdir + "/DeviceName_" + deviceName + ".txt"
    os.system(strCopySMSCmd)

    #SMS Verification
    time.sleep(5)
    strTempPath = mobdir + "//DeviceName_" + deviceName + ".txt"
    createNewSDCardFile = "adb -s " + deviceName + " push " + strtsxtPath + " /sdcard/"
    filecontents = Path(strTempPath).read_text()
    Module.logger.INFO("Actual SMS received on the device is" + filecontents)
    if smsTextToVerify in filecontents:
        Module.logger.INFO("SUCCESS : SMS Verification is successfull. Received SMS for "+smsTextToVerify)
        os.system(createNewSDCardFile)
        Module.logger.INFO("Sd card contents cleared")
    else:
        Module.Report.Failure(driverObject, "SMS Verification is Not Successfull")
        Excep.raiseException("SMS Verification is Not Successfull")
        os.system(createNewSDCardFile)
        Module.logger.INFO("Sd card contents cleared")