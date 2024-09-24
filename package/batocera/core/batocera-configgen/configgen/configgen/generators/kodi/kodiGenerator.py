from ... import Command
from ... import batoceraFiles
from ... import controllersConfig
from ..Generator import Generator
from . import kodiConfig

class KodiGenerator(Generator):

    # Main entry of the module
    # Configure kodi inputs and return the command to run
    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        kodiConfig.writeKodiConfig(playersControllers)
        commandArray = ["kodi", rom]
        return Command.Command(array=commandArray)
