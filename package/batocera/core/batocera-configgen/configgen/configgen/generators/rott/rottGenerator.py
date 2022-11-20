#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class RottGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["rott-darkwar"]

        return Command.Command(array=commandArray)
