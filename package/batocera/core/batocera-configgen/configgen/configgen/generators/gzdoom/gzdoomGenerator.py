#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class GzdoomGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        if (rom.__contains__(".gzdoom")):
            f=open(rom)
            content=f.readlines()
            commandArray = ["gzdoom", "+set", "vid_preferbackend", "1", "+set", "vid_rendermode", "4", "+set", "gl_texture_filter", "0", "+set", "gl_texture_filter_anisotropic", "0", "-iwad", content[0], "-file", content[1]]
        else:
            commandArray = ["gzdoom", "+set", "vid_preferbackend", "1", "+set", "vid_rendermode", "4", "+set", "gl_texture_filter", "0", "+set", "gl_texture_filter_anisotropic", "0", "-iwad", rom]

        return Command.Command(
            array=commandArray,
            env={
                'DOOMWADDIR': '/userdata/roms/prboom',
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
            })
