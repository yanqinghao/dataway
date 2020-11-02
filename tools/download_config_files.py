from suanpan.storage import storage
from suanpan.interfaces import HasArguments
from suanpan.objects import Context
from suanpan.log import logger


def getCleanArgs(argsDict):
    return {key: value for key, value in argsDict.items() if value}


kwds = getCleanArgs(
    HasArguments.defaultArgumentsFormat(Context(**HasArguments.getArgsDictFromEnv()),
                                        storage.ARGUMENTS))
storePath = getattr(Context(**HasArguments.getArgsDictFromEnv()), "configFile", None)
storageType = kwds["type"]
logger.info(f"Download Config File From {storageType}.")
storage.setBackend(**kwds)
storage.download(storePath, "dataway/src/main/resources/application.properties")
