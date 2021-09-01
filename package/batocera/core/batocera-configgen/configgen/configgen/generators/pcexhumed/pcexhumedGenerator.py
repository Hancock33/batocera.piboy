#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class PcexhumedGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["pcexhumed", "-j", "/userdata/roms/pcexhumed/"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
