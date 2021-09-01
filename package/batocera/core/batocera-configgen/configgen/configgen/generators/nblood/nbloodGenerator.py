#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class NbloodGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["nblood", "-j=/userdata/roms/nblood"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
