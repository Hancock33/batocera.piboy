#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class NbloodGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["nblood", "-j=/userdata/roms/nblood"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'SDL_MOUSE_RELATIVE_SPEED_SCALE': '2.0'
            })
