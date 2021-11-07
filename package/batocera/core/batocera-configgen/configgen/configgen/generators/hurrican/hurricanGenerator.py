#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class HurricanGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["hurrican"]

        return Command.Command(
            array=commandArray,
            env={
                'LIBGL_FB': '4',
                'LIBGL_NOTEST': '1',
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
