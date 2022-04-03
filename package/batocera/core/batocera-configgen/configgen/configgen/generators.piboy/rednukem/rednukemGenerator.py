#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class RednukemGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["rednukem", "-j", "/userdata/roms/rednukem", "-g", rom]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'SDL_MOUSE_RELATIVE_SPEED_SCALE': '2.0'
            })
