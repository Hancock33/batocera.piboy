from ... import Command
from ... import batoceraFiles
from ... import controllersConfig
from ..Generator import Generator

class VanillaraGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, esmetadata, guns, wheels, gameResolution):
        commandArray = ["vanillara"]
        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
