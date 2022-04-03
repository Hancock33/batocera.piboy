#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class Doom3Generator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):

        commandArray = ["dhewm3", "+set", "fs_basepath", "/userdata/roms/doom3", "+set", "r_mode", "3"]

        return Command.Command(
            array=commandArray,
            env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
