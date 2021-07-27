#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class simcoupeGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["samcoupe", "autoboot", "-disk1", rom "-fullscreen"]
        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
