#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class VoidswGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["voidsw", "-j", "/userdata/roms/voidsw"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
