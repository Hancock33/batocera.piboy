from ... import Command
from ... import batoceraFiles
from ... import controllersConfig
from ..Generator import Generator

class Supertux2Generator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["supertux2" ]

        return Command.Command(
            array=commandArray,
            env={"SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)}
        )
