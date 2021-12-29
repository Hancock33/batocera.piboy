#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig
import os

class BermudaGenerator(Generator):

    def generate(self, system, rom, playersControllers, gameResolution):
        os.chdir("/userdata/roms/bermuda")
        commandArray = ["bermuda", "--datapath=/userdata/roms/bermuda", "--savepath=/userdata/saves/bermuda"]

        return Command.Command(
            array=commandArray,
            env={
                'LIBGL_FB': '4',
                'LIBGL_NOTEST': '1',
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers),
                'PIPEWIRE_LATENCY': '1024/48000'
            })
