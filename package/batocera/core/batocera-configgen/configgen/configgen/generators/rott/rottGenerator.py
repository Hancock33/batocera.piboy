#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class RottGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["rott-darkwar"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers),
                'PIPEWIRE_LATENCY': '1024/48000'
            })
