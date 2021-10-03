#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class PrototypeGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["prototype.sh"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
