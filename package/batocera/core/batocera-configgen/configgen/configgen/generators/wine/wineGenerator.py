#!/usr/bin/env python

from generators.Generator import Generator
import Command
import os
from os import path

class WineGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        if system.name == "windows32_installers":
            commandArray = ["batocera-wine", "install", "32", rom]
            return Command.Command(array=commandArray)
        elif system.name == "windows32":
            commandArray = ["batocera-wine", "play", "32", rom]
            return Command.Command(array=commandArray)
        elif system.name == "windows64_installers":
            commandArray = ["batocera-wine", "install", "64", rom]
            return Command.Command(array=commandArray)
        elif system.name == "windows64":
            commandArray = ["batocera-wine", "play", "64", rom]
            return Command.Command(array=commandArray)

        raise Exception("invalid system " + system.name)
