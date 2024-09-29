from ... import Command
from ... import batoceraFiles
from ... import controllersConfig
from ..Generator import Generator

class FreedroidGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["freedroid"]
        return Command.Command(array=commandArray)
