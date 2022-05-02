#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class LzdoomGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        if (rom.__contains__(".gzdoom")):
            f=open(rom)
            content=f.readlines()
            commandArray = ["lzdoom", "-iwad", content[0], "-file", content[1]]
        else:
            commandArray = ["lzdoom", "-iwad", rom]

        return Command.Command(
            array=commandArray,
            env={
                'DOOMWADDIR': '/userdata/roms/prboom',
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
