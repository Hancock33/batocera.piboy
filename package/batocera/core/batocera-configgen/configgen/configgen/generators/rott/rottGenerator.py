#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class RottGenerator(Generator):

    def generate(self, system, rom, playersControllers, metadata, guns, wheels, gameResolution):
        commandArray = ["rott-darkwar"]

        return Command.Command(array=commandArray)
