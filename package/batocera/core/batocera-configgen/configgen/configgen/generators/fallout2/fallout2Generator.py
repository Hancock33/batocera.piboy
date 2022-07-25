#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig
import os

class Fallout2Generator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        os.chdir("/userdata/roms/ports/fallout2")
        commandArray = ["fallout2-ce"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
