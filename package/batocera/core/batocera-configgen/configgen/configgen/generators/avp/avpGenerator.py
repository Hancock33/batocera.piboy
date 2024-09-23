from ... import Command
from ... import batoceraFiles
from ..Generator import Generator

class AvpGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["avp", "-f", "-p", "/userdata/roms/ports/avp/"]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
