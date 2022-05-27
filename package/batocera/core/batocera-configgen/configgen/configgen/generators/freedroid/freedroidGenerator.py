#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class FreedroidGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["freedroid"]
        return Command.Command(array=commandArray)
