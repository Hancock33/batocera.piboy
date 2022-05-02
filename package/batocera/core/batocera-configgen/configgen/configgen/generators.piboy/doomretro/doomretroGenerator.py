#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class DoomretroGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["doomretro", rom]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
