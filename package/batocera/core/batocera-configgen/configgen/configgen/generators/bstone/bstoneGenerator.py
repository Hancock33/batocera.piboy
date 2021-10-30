#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class BstoneGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        addon = "/userdata/roms/bstone/SW"
        if (rom.__contains__("AOG")):
            addon = "/userdata/roms/bstone/AOG"

        if (rom.__contains__("PS")):
            addon = "/userdata/roms/bstone/PS"

        if (rom.__contains__("TD")):
            addon = "/userdata/roms/bstone/SW"

        commandArray = ["bstone", "--data_dir", addon]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
