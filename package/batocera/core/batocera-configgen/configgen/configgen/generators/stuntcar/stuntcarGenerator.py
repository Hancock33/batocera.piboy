#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig
import os

class StuntcarGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        os.chdir("/usr/share/stuntcar")
        commandArray = ["/usr/share/stuntcar/stuntcar"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
