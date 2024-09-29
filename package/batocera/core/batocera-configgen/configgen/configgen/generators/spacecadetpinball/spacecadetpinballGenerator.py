from ... import Command
from ... import batoceraFiles
from ... import controllersConfig
from ..Generator import Generator

class SpacecadetpinballGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["SpaceCadetPinball", "-fullscreen"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
