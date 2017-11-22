import Module.getObject
import Module.logger
import Module.Algorithms
import Module.Utility
import Module.CleanUp
import Module.Report
import Class.UserDefinedException

def verifyTableColumnHeaders(driverObject,tableName,ColNamesList):
    Excep = Class.UserDefinedException.UserDefinedException()
    counter = 0
    blnVerified = False
    obj = Module.getObject.getObjByRepo(driverObject, "table", tableName)
    if obj != None:
        ColNames = ColNamesList.split(',')
        for i in range(0, len(ColNames)):
            if ColNames[i] in obj[0].text:
                counter += 1
                if counter == len(ColNames)-1:
                    blnVerified = True
                    Module.logger.INFO("Table Headers Verified. The table actually contains the following Column Names " + obj[0].text)
        if blnVerified == False:
            Module.Report.Failure(driverObject,"Table Headers Verified. The table does not contain the headers " + str(ColNames))
            Excep.raiseException("Table Headers Verified. The table does not contain the headers " + str(ColNames))
    else:
        Module.Report.Failure(driverObject,"Table " + tableName+ " not found")
        Excep.raiseException("No object found for table " + tableName)

