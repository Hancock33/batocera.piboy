from ... import Command
from ... import batoceraFiles
from ..Generator import Generator

class BluesGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["blues", "--datapath=/userdata/roms/ports/blues", "--fullscreen"]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
