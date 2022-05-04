#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig
import os

class F2bglGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        os.chdir("/userdata/roms/f2bgl")
        commandArray = ["f2bgl", "--datapath=/userdata/roms/f2bgl", "--savepath=/userdata/saves/f2bgl"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
