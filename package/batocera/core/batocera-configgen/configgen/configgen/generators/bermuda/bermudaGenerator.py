#!/usr/bin/env python

import Command
from generators.Generator import Generator
import controllersConfig
import os

class BermudaGenerator(Generator):

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        os.chdir("/userdata/roms/ports/bermuda")
        commandArray = ["bermuda", "--datapath=/userdata/roms/ports/bermuda", "--musicpath=/userdata/roms/ports/bermuda/MUSIC", "--savepath=/userdata/saves/bermuda", "--fullscreen"]

        if system.isOptSet("bermuda_aspect"):
            if system.config['bermuda_aspect'] == '1':
                commandArray.append("--widescreen=16:9")

        return Command.Command(
            array=commandArray,
            env={
                'SDL_GAMECONTROLLERCONFIG': controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })
