#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class OpenjkjoGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["openjo_sp", "+set", "fs_basepath", "/userdata/roms/openjkjo", "+set", "r_mode", "-1", "+set", "r_customwidth", "640", "+set", "r_customheight", "480", "+set", "r_swapInterval", "1", "+set", "com_jk2", "1"]
        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
