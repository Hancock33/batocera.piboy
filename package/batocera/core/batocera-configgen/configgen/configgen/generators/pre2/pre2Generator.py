#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig
import os

class Pre2Generator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["pre2", "--datapath=/userdata/roms/pre2"]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
