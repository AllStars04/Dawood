import Module.logger
import Module.Report

class UserDefinedException(Exception):
    def raiseException(self, message):
        self.message = message
        Module.logger.ERROR(message)
        #Module.CleanUp.killAllProcess()
        #Module.Report.stopJVM()
        raise UserDefinedException(message)
