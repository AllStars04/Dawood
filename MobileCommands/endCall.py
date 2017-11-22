import Module.logger
import Module.Report
import os
import Class.UserDefinedException
import time
import subprocess

Excep = Class.UserDefinedException.UserDefinedException()

def endCall(driverObject,deviceId):
    try:
        endcallcmd = "adb -s " + deviceId + " shell input keyevent 6"
        retCode = subprocess.call(endcallcmd, shell=True)
        if (retCode != 0):
            Module.Report.Failure(driverObject,"Device "+deviceId+" is unavailable")
            Module.logger.ERROR("Device Id "+deviceId+" is unavailable")
            Excep.raiseException("Device Id "+deviceId+" is unavailable")
        time.sleep(3)
    except OSError as e:
        Module.Report.Failure(driverObject, "Phone call cannot be ended from " + deviceId)
        Module.logger.ERROR("Phone call cannot be ended from " + deviceId)
        Excep.raiseException("Phone call cannot be ended from " + deviceId+".OS Error: " +e)
