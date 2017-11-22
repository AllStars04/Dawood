import os
import psutil
import Module.logger
#
# def killProcessFromTaskManager(processName):
#     for proc in psutil.process_iter(attrs=['pid', 'name']):
#         # check whether the process name matches
#         print(proc.name())
#         if proc.name() == processName:
#             try:
#                 proc.kill()
#                 break
#             except:
#                 Module.logger.INFO("Process does not exist")

def killAllProcess():
    Module.logger.INFO("TEST")
    #Kill ChromeDriver and Chrome
    # os.system("taskkill /im chrome.exe /F")
    # os.system("taskkill /im chromedriver.exe /F")
    # killProcessFromTaskManager("chromedriver.exe")
    # killProcessFromTaskManager("chrome.exe")
