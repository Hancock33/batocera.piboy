#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class WitchavenGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["whaven"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'SDL_MOUSE_RELATIVE_SPEED_SCALE': '3.0'
            })
