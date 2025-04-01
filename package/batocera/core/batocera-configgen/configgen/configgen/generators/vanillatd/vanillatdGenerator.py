from ... import Command
from ... import batoceraFiles
from ... import controllersConfig
from ..Generator import Generator

class VanillatdGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["vanillatd"]
        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
