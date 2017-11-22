import Module.logger
import Module.Report
import os
import Class.UserDefinedException
import time
import subprocess
Excep = Class.UserDefinedException.UserDefinedException()

def callNo(driverObject,deviceId,receiverNo):
    try:
        callcmd= "adb -s "+deviceId+" shell am start -a android.intent.action.CALL -d tel:"+receiverNo
        retCode= subprocess.call(callcmd, shell=True)
        if(retCode != 0):
            Module.Report.Failure(driverObject, "Device Id "+deviceId+" or Receiver No: "+receiverNo+" is incorrect")
            Module.logger.ERROR("Device Id "+deviceId+" or Receiver No: "+receiverNo+" is incorrect")
            Excep.raiseException("Device Id "+deviceId+" or Receiver No: "+receiverNo+" is incorrect")
        time.sleep(3)
    except OSError as e:
         Module.Report.Failure(driverObject, "Phone call to no"+receiverNo+" is not successfull")
         Module.logger.ERROR("Phone call"+receiverNo+" is not successfull" )
         Excep.raiseException("Phone call"+receiverNo+" is not successfull.OS Error:" , e)
