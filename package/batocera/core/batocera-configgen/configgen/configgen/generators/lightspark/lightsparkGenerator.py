#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class LightsparkGenerator(Generator):

    def def generate(self, system, rom, playersControllers, guns, wheels, gameResolution):
        commandArray = ["lightspark", "--fullscreen", "-s", "local-with-networking", rom]
        return Command.Command(
            array=commandArray)

    def getMouseMode(self, config):
        return True
