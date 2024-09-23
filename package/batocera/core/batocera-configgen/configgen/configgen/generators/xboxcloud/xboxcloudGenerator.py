from ... import Command
from ... import batoceraFiles
from ..Generator import Generator

class XboxcloudGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["/usr/bin/greenlight", "--no-sandbox", "--fullscreen"]

        return Command.Command(
            array=commandArray,
            env={
              'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
        })
