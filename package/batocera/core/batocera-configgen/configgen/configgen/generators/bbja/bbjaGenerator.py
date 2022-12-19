#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig
import os

class BbjaGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["bbja", "--datapath=/userdata/roms/ports/bbja", "--fullscreen"]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
