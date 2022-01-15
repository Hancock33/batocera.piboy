#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class OpenjkjaGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["openjk_sp", "+set", "fs_basepath", "/userdata/roms/openjkja", "+set", "r_mode", "-1", "+set", "r_customwidth", "640", "+set", "r_customheight", "480", "+set", "r_swapInterval", "1"]
        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
