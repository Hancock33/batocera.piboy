from ... import Command
from ... import batoceraFiles
from ..Generator import Generator

class RottGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["rott-darkwar"]

        return Command.Command(array=commandArray)
