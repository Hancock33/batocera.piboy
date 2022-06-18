#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class Srb2Generator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["srb2", rom]

        return Command.Command(
            array=commandArray,
            env={
                'SRB2WADDIR': '/userdata/roms/ports/srb2',
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'SDL_MOUSE_RELATIVE_SPEED_SCALE': '2.0'
            })
