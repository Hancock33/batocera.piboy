#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig
import os

class BluesGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["blues", "--datapath=/userdata/roms/ports/blues", "--fullscreen"]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
