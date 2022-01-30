#!/usr/bin/env python

import Command
from generators.Generator import Generator
import batoceraFiles
from . import kodiConfig

class KodiGenerator(Generator):

    # Main entry of the module
    # Configure kodi inputs and return the command to run
    def generate(self, system, rom, playersControllers, gameResolution):
        kodiConfig.writeKodiConfig(playersControllers)
        commandArray = ["kodi", rom]
        return Command.Command(array=commandArray)
