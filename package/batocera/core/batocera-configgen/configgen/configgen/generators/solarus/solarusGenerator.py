#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig
import batoceraFiles
import codecs
import os
import zipfile

class SolarusGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, wheels, gameResolution):

        # basis
        commandArray = ["solarus-run", "-fullscreen=yes", "-cursor-visible=no", "-lua-console=no", rom]

        return Command.Command(
            array=commandArray,
            env={
            'SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS': '0',
            'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
