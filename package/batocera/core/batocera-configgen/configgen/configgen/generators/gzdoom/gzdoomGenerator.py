#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class GzdoomGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        if (rom.__contains__(".gzdoom")):
            try:
                f=open(rom)
                lines=f.readlines()
                commandArray = ["gzdoom", "+set", "vid_preferbackend", "1", "+set", "vid_rendermode", "4", "-iwad", lines(0), "-file", lines(1)]
            except:
                print("Unable to open file")
        else:
            commandArray = ["gzdoom", "+set", "vid_preferbackend", "1", "+set", "vid_rendermode", "4", "-iwad", rom]

        return Command.Command(
            array=commandArray,
            env={
                'DOOMWADDIR': '/userdata/roms/prboom',
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'SDL_MOUSE_RELATIVE_SPEED_SCALE': '2.0'

            })
