import os
from os import path

from ... import Command
from ... import batoceraFiles
from ..Generator import Generator

class HodeGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        os.chdir("/userdata/roms/ports/hode")
        commandArray = ["hode", "--datapath=/userdata/roms/ports/hode", "--savepath=/userdata/saves/hode"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
