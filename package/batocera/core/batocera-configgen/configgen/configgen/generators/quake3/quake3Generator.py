#!/usr/bin/env python
import os
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

class Quake3Generator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["ioquake3", "+set", "cl_renderer", "vulkan"]
        os.chdir(os.path.dirname(os.path.abspath(rom)))

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
