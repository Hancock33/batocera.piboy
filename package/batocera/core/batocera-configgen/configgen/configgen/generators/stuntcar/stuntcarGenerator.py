#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig
import os

class StuntcarGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        os.chdir("/usr/share/stuntcar")
        commandArray = ["/usr/share/stuntcar/stuntcar", "-f"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })

    def getInGameRatio(self, config, gameResolution, rom):
        return 16/9
