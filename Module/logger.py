import logging
import inspect
import os
import Module.Utility
import errno

loglevel = Module.Utility.ReadDataFromJsonFile("tool","loglevel")
logging.basicConfig(level=logging.INFO)

loglevel = Module.Utility.ReadDataFromJsonFile("tool","loglevel")
if loglevel == "INFO":
    logging.basicConfig(level=logging.INFO)
elif loglevel == "ERROR":
     logging.basicConfig(level=logging.ERROR)
elif loglevel == "DEBUG":
     logging.basicConfig(level=logging.DEBUG)
elif loglevel == "WARNING":
     logging.basicConfig(level=logging.WARNING)
elif loglevel == "CRITICAL":
     logging.basicConfig(level=logging.CRITICAL)
else:
     logging.basicConfig(level=logging.NOTSET)

cwd = os.getcwd()
pcwd = "\\".join(cwd.split('\\')[:-1])
logdir = cwd + "\\logs"
try:
    dirExists = os.path.exists(logdir)
    if not dirExists:
        logdir = pcwd + "\\Config"
except OSError as exception:
    if exception.errno != errno.EEXIST:
        raise

logfile = logdir+"\\automation.log"

handler = logging.FileHandler(logfile)
handler.setLevel(loglevel)

formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)


def INFO(msg):

    curframe = inspect.currentframe()
    calframe = inspect.getouterframes(curframe, 2)

    logger = logging.getLogger(calframe[1][3])
    logger.setLevel(loglevel)
    logger.addHandler(handler)
    logger.info(msg)

def DEBUG(msg):

    curframe = inspect.currentframe()
    calframe = inspect.getouterframes(curframe, 2)

    logger = logging.getLogger(calframe[1][3])
    logger.setLevel(loglevel)
    logger.addHandler(handler)
    logger.debug(msg)

def ERROR(msg):

    curframe = inspect.currentframe()
    calframe = inspect.getouterframes(curframe, 2)

    logger = logging.getLogger(calframe[1][3])
    logger.setLevel(loglevel)
    logger.addHandler(handler)
    logger.error(msg)

def WARNING(msg):

    curframe = inspect.currentframe()
    calframe = inspect.getouterframes(curframe, 2)

    logger = logging.getLogger(calframe[1][3])
    logger.setLevel(loglevel)
    logger.addHandler(handler)
    logger.warning(msg)

def CRITICAL(msg):

    curframe = inspect.currentframe()
    calframe = inspect.getouterframes(curframe, 2)

    logger = logging.getLogger(calframe[1][3])
    logger.setLevel(loglevel)
    logger.addHandler(handler)
    logger.critical(msg)

def NOTSET(msg):

    curframe = inspect.currentframe()
    calframe = inspect.getouterframes(curframe, 2)

    logger = logging.getLogger(calframe[1][3])
    logger.setLevel(loglevel)
    logger.addHandler(handler)
    logger.log(msg)




