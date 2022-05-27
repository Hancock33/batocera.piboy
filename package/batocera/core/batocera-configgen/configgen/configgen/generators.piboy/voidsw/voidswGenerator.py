#!/usr/bin/env python
import os
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

class VoidswGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        addon = "-addon0"
        if (rom.__contains__("WT")):
            addon = "-addon1"

        if (rom.__contains__("TD")):
            addon = "-addon2"

        commandArray = ["voidsw", addon, "-j", os.path.dirname(os.path.abspath(rom))]
        os.chdir(os.path.dirname(os.path.abspath(rom)))

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'SDL_MOUSE_RELATIVE_SPEED_SCALE': '2.0'
            })
