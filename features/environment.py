import Class.Automation
import Module.Report


def before_all(context):
    Module.Report.initiateJVM()

def after_all(context):
    try:
        Module.logger.INFO("after_all starts")
        print("after_all starts")
        Module.Report.stopJVM()
        Module.logger.INFO("after_all ends")
    except:
        pass

def before_scenario(context,scenario):
    context.driver = Class.Automation.Automation()

def after_scenario(context,scenario):
    try:
        print("after_scenario starts")
        context.driver.logout()
        print("after_scenario ends")
    except:
        pass