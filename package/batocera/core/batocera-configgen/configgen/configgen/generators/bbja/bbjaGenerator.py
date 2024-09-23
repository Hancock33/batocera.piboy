from ... import Command
from ... import batoceraFiles
from ..Generator import Generator

class BbjaGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["bbja", "--datapath=/userdata/roms/ports/bbja", "--fullscreen"]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
