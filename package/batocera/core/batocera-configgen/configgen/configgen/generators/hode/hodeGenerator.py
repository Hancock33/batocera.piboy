#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig
import os

class HodeGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        os.chdir("/userdata/roms/hode")
        commandArray = ["hode", "--datapath=/userdata/roms/hode", "--savepath=/userdata/saves/hode"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
