#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class SpacecadetpinballGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["SpaceCadetPinball"]

        return Command.Command(
            array=commandArray,
            env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'PIPEWIRE_LATENCY': '1024/48000'
            })
