#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class Eduke32Generator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["eduke32", rom, "-game_dir", "/userdata/roms/eduke32"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'SDL_MOUSE_RELATIVE_SPEED_SCALE': '2.0'
            })
