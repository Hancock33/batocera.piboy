#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class OpenJazzGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        gamedir = rom.replace('openjazz.game', '')
        commandArray = ["OpenJazz", gamedir]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
