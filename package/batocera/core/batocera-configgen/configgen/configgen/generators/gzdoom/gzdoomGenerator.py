#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class GzdoomGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["lzdoom", "-iwad", rom]

        return Command.Command(
            array=commandArray,
            env={
                'DOOMWADDIR': '/userdata/roms/prboom',
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'SDL_MOUSE_RELATIVE_SPEED_SCALE': '2.0'

            })
