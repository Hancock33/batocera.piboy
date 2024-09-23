from ... import Command
from ... import batoceraFiles
from ..Generator import Generator

class MplayerGenerator(Generator):

    # Main entry of the module
    # Configure kodi inputs and return the command to run
    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["mpv", "--fs", rom]
        return Command.Command(array=commandArray)
