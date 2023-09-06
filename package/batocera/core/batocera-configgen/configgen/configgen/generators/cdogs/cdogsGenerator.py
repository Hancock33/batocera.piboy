#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class CdogsGenerator(Generator):

    def def generate(self, system, rom, playersControllers, guns, wheels, gameResolution):
        commandArray = ["cdogs", "--fullscreen"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
