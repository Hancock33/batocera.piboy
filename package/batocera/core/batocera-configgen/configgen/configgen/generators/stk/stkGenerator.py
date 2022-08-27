#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig


class StkGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["supertuxkart", "--render-driver=vulkan"]

        return Command.Command(
            array=commandArray)
