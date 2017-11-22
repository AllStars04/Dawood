from jpype import *
from datetime import datetime
import os
import errno
import Module.logger


cwd = os.getcwd()
pcwd = "\\".join(cwd.split('\\')[:-1])
libdir = cwd + "\\libraries"
try:
    dirExists = os.path.exists(libdir)
    if not dirExists:
        libdir = pcwd + "\\libraries"
except OSError as exception:
        if exception.errno != errno.EEXIST:
            raise

jarLoc = libdir + "\\extentreports-2.40.2.jar"
jarLoc1 = libdir + "\\jsoup-1.8.3.jar"
jarLoc2 = libdir + "\\freemarker-2.3.23.jar"

reportFilePath = "C:\\Reports\\"
screenshotPath = "C:\\Reports\\ErrorScreenShots\\"

def initiateJVM():
    Module.logger.INFO("Starting JVM by compiling required class files")
    jvmPath = getDefaultJVMPath()
    print("JVM path :"+jvmPath)
    #add comma separted
    startJVM(jvmPath, '-Djava.class.path=' + jarLoc + ';' + jarLoc1 + ';' + jarLoc2)
    Module.logger.INFO("JVM Started")

def stopJVM():
    Module.logger.INFO("Shutting down the JVM")
    shutdownJVM()


def createTestReport(filename,testName,append):
    global tcName
    tcName= testName

    Module.logger.INFO("Starting report")
    jPack = JPackage("com.relevantcodes.extentreports")
    filePath = reportFilePath+filename+".html"
    extent = jPack.ExtentReports
    global logStatus
    logStatus = jPack.LogStatus
    javaPackage = JPackage("java.lang")
    javaClass = javaPackage.Boolean
    global extentObj
    extentObj = extent(JString(filePath), javaClass(append))
    extentObj.addSystemInfo(JString("Host Name"), JString("Vodafone"))
    extentObj.addSystemInfo(JString("Environment"), JString("QA"))
    extentObj.addSystemInfo(JString("User Name"), JString("Test"))
    global extentTest
    extentTest = extentObj.startTest(JString(tcName), JString("Description"))

def endTestReport():
    extentObj.endTest(extentTest)
    extentObj.flush()

def Info(driverObject,message):
    # screenShotName = tcName + "_" + getDate()
    # screenShotPath = takeScreenShot(driverObject, screenShotName)
    message =message
    extentTest.log(logStatus.INFO, JString(message))
    #extentTest.log(logStatus.INFO, "Snapshot Details: " + extentTest.addScreenCapture(screenShotPath))
    endTestReport()

def Error(message):
    message = message
    extentTest.log(logStatus.ERROR, JString(message))

def Success(driverObject,message):
    screenShotName = tcName +"_"+getDate()
    screenShotPath = takeScreenShot(driverObject,screenShotName)
    message = message
    extentTest.log(logStatus.PASS, JString(message))
    extentTest.log(logStatus.INFO,"Snapshot Details: " + extentTest.addScreenCapture(screenShotPath))
    endTestReport()

def Failure(driverObject,message):
    screenShotName = tcName +getDate()
    screenShotPath = takeScreenShot(driverObject,screenShotName)
    message = message
    extentTest.log(logStatus.FAIL, JString(message))
    extentTest.log(logStatus.FAIL,"Snapshot Details: "+extentTest.addScreenCapture(screenShotPath))
    endTestReport()

def takeScreenShot(self,testName):
    tcName = testName
    createDirectory(screenshotPath)
    screenPath = screenshotPath+tcName+".png"

    try:
        self.driver.save_screenshot(screenPath)
    except:
        self.mobiledriver.save_screenshot(screenPath)
    return screenPath

def getDate():
    currentDate = datetime.now()
    Module.logger.INFO("Present date and time :"+currentDate.strftime('%Y%m%d_%H%M%S'))
    return currentDate.strftime('%Y%m%d_%H%M%S')

def createDirectory(path):
    try:
        if not os.path.exists(path):

            os.makedirs(path)
    except OSError as exception:
            if exception.errno != errno.EEXIST:
                raise