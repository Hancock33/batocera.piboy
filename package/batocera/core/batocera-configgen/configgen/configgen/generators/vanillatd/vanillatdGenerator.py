#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class VanillatdGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["vanillatd"]
        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
