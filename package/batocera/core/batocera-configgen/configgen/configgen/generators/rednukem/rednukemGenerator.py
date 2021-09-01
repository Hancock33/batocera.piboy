#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class RednukemGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["rednukem", "-j", "/userdata/roms/rednukem"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
