#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class BstoneGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        addon = "/userdata/roms/bstone/SW"
        gver = "--aog_sw"

        if (rom.__contains__("AOG")):
            addon = "/userdata/roms/bstone/AOG"
            gver = "--aog"

        if (rom.__contains__("PS")):
            addon = "/userdata/roms/bstone/PS"
            gver = "--ps"

        if (rom.__contains__("SW")):
            addon = "/userdata/roms/bstone/SW"
            gver = "--aog_sw"

        commandArray = ["bstone", gver, "--data_dir", addon]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0'
            })
