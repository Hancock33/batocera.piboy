from ... import Command
from ... import batoceraFiles
from ... import controllersConfig
from ..Generator import Generator

class Pre2Generator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["pre2", "--datapath=/userdata/roms/ports/pre2", "--fullscreen"]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
