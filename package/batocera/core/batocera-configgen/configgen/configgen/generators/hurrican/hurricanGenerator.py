#!/usr/bin/env python
import os
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

class HurricanGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["hurrican"]
        os.chdir(os.path.dirname(os.path.abspath(rom)))

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
