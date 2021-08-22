#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class OpenJazzGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["OpenJazz", "/userdata/roms/openjazz/"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
