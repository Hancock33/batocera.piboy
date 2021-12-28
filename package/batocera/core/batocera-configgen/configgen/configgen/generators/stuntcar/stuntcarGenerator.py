#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig
import os

class StuntcarGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        os.chdir("/usr/share/stuntcar")
        commandArray = ["stuntcar"]

        return Command.Command(
            array=commandArray,
            env={
                'LIBGL_FB': '4',
                'LIBGL_NOTEST': '1',
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers),
                'PIPEWIRE_LATENCY': '1024/48000'
            })
