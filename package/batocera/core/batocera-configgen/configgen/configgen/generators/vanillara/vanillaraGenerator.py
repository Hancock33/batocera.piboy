#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class VanillaraGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["vanillara"]
        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
