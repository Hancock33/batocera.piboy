#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class Nukem2Generator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["RigelEngine", "/userdata/roms/nukem2"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
