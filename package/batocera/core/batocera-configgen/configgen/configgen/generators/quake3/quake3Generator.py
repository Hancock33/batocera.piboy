#!/usr/bin/env python
import os
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

class Quake3Generator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["ioquake3", "+set", "cl_renderer", "vulkan", "+set", "fs_basePath", "/userdata/roms/ports/quake3" ]
        os.chdir("/usr/share/quake3")

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
