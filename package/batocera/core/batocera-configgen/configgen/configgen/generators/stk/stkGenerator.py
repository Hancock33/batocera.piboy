#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class StkGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        commandArray = ["supertuxkart" ]

        return Command.Command(
            array=commandArray)
