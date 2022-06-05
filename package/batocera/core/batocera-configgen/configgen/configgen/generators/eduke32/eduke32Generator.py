#!/usr/bin/env python
import os
from os import path
import Command
from generators.Generator import Generator
import controllersConfig

class Eduke32Generator(Generator):
    if os.path.isfile('/tmp/piboy'):
        os.system('piboy_keys eduke32.keys')

    def generate(self, system, rom, playersControllers, guns, gameResolution):
        commandArray = ["eduke32", rom, "-game_dir", os.path.dirname(os.path.abspath(rom))]
        os.chdir(os.path.dirname(os.path.abspath(rom)))

        if os.path.isfile('/tmp/piboy'):
            return Command.Command(
                array=commandArray,
                env={
                'SDL_AUTO_UPDATE_JOYSTICKS': '0',
                'SDL_MOUSE_RELATIVE_SPEED_SCALE': '2.0'
            })
        else:
            return Command.Command(
                array=commandArray,
                env={
                "SDL_GAMECONTROLLERCONFIG": controllersConfig.generateSdlGameControllerConfig(playersControllers)
            })